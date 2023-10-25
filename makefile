venv:
	venv\Scripts\activate

start:
	python movies\app.py

install_app:
	..\venv\Scripts\pip install -e .

development:
	..\venv\Scripts\pserve development.ini --reload