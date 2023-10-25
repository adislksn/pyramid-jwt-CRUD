'''import setuptools'''
from setuptools import setup

# List of dependencies installed via `pip install -e .`
# by virtue of the Setuptools `install_requires` value below.
requires = [
    'pyramid',
    'pymysql',
    'pyramid_jinja2',
    'pyramid_debugtoolbar',
    'pyramid_jwt',
]

setup(
    name='movies',
    install_requires=requires,
    entry_points={
        'paste.app_factory': [
            'main = tutorial:main'
        ],
    },
)