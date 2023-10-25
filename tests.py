'''import unittest'''
import unittest
from pyramid import testing
from movies.setup import login

class TutorialViewTests(unittest.TestCase):
    def setUp(self):
        self.config = testing.setUp()

    def tearDown(self):
        testing.tearDown()

    def test_success_login(self):
        request = login({'login': '123', 'password': '123'})
        self.assertEqual(request['greet'], 'ok')