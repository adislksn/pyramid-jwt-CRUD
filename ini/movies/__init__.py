'''import module'''
from waitress import serve
from pyramid.config import Configurator
from pyramid.view import view_config
import pymysql
import jwt
import datetime

# Koneksi ke database MySQL

connection = pymysql.connect(
    host='localhost',
    user='root',
    password='',
    db='pyramid-themovies',
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor
)

def auth_jwt_verify(request):
    '''verify jwt token'''
    authorization_header = request.cookies.get('token')
    if authorization_header:
        decoded_user = jwt.decode(authorization_header, 'secret', algorithms=['HS256'])
        with connection.cursor() as cursor:
            sql = "SELECT refresh_token FROM tokens WHERE user_id=%s"
            cursor.execute(sql, (decoded_user['sub'],))
            result = cursor.fetchone()
        if result:
            return decoded_user
        return None
    return None

@view_config(route_name='login', renderer='json')
def login(request):
    '''Create a login view
    '''
    auth_user = auth_jwt_verify(request)
    if auth_user:
        return {
            'greet': 'error',
            'message': 'Already logged in'
        }
    login = request.POST['login']
    password = request.POST['password']
    with connection.cursor() as cursor:
        sql = "SELECT * FROM users WHERE username=%s AND password=%s"
        cursor.execute(sql, (login, password))
        user = cursor.fetchone()
    if user:
        payload = {
            'sub': user['id'],
            'name': user['username'],
            'exp': datetime.datetime.utcnow() + datetime.timedelta(minutes=100000)
        }
        encode = jwt.encode(payload, 'secret', algorithm='HS256')
        set_cookie = request.response.set_cookie('token', encode, max_age=10000, httponly=True)
        with connection.cursor() as cursor:
            sql = "INSERT INTO tokens (user_id, refresh_token, jwt_token) VALUES (%s, %s, %s)"
            cursor.execute(sql, (user['id'], encode, 0))
            connection.commit()
        return {
            'greet': 'ok',
            'token': encode
        }
    else:
        return {
            'greet': 'error',
            'token': None
        }

@view_config(route_name='logout', renderer='json')
def logout(request):
    '''Create a logout view'''
    auth_user = auth_jwt_verify(request)
    if auth_user:
        with connection.cursor() as cursor:
            sql = "DELETE FROM tokens WHERE user_id=%s"
            cursor.execute(sql, (auth_user['sub'],))
            connection.commit()
            
        request.response.delete_cookie('token')
        return {
            'greet': 'ok',
            'message': 'Successfully logged out'
        }
    return {
        'greet': 'error',
        'message': 'Token not found'
    }

@view_config(route_name='movies', request_method='GET', renderer='json')
def movie(request):
    '''Create a hello view to get'''
    auth_user = auth_jwt_verify(request)
    if auth_user:
        # show from table movies
        with connection.cursor() as cursor:
            sql = "SELECT * FROM movies"
            cursor.execute(sql)
            result = cursor.fetchall()
            
        data = {}
        for item in result:
            data[item['id']] = {
                'id': item['id'],
                'judul': item['judul'],
                'genre': item['genre'],
                'tahun': item['tahun'],
                'director': item['director'],
            }
        return {
            'greet': 'ok', 
            'name': auth_user['name'], 
            'data': data
            }
    else:
        request.response.status = 401  # Unauthorized
        return {'greet': 'Unauthorized', 'name': '', 'error': 'token not found'}

@view_config(route_name='movie-create', request_method='POST', renderer="json")
def movie_create(request):
    '''Create a movie view to post'''
    auth_user = auth_jwt_verify(request)
    if auth_user:
        # insert into table movies
        with connection.cursor() as cursor:
            sql = "INSERT INTO movies (judul, genre, tahun, director) VALUES (%s, %s, %s, %s)"
            cursor.execute(sql, (request.POST['judul'], request.POST['genre'], request.POST['tahun'], request.POST['director']))
            connection.commit()
        return {'greet': 'ok', 'name': auth_user['name']}
    else:
        request.response.status = 401
        return {'greet': 'Unauthorized', 'name': '', 'error': 'token not found'}

@view_config(route_name='movie-update', request_method='PUT', renderer="json")
def movie_update(request):
    '''Create a movie view to put'''
    auth_user = auth_jwt_verify(request)
    if auth_user:
        # update table movies
        with connection.cursor() as cursor:
            sql = "UPDATE movies SET judul=%s, genre=%s, tahun=%s, director=%s WHERE id=%s"
            cursor.execute(sql, (request.POST['judul'], request.POST['genre'], request.POST['tahun'], request.POST['director'], request.POST['id']))
            connection.commit()
        return {'greet': 'ok', 'name': auth_user['name']}
    else:
        request.response.status = 401
        return {'greet': 'Unauthorized', 'name': '', 'error': 'token not found'}
    
@view_config(route_name='movie-delete', request_method='DELETE', renderer="json")
def movie_delete(request):
    '''Create a movie view to delete'''
    auth_user = auth_jwt_verify(request)
    if auth_user:
        # delete from table movies
        with connection.cursor() as cursor:
            sql = "DELETE FROM movies WHERE id=%s"
            cursor.execute(sql, (request.POST['id']))
            connection.commit()
        return {'greet': 'ok', 'name': auth_user['name']}
    else:
        request.response.status = 401
        return {'greet': 'Unauthorized', 'name': '', 'error': 'token not found'}


def main(global_config, **settings):
    config = Configurator(settings={'jwt.secret': 'secret'})
    config.add_route('login', '/login')
    config.add_route('logout', '/logout')
    config.add_route('movies', '/movie')
    config.add_route('movie-create', '/movie-create')
    config.add_route('movie-update', '/movie-update')
    config.add_route('movie-delete', '/movie-delete')
    config.scan()
    config.add_static_view(name='static', path='static')
    config.include('pyramid_jwt')
    return config.make_wsgi_app()
