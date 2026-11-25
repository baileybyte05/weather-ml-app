import unittest
from app import app

class TestAppSmoke(unittest.TestCase):
	def setUp(self):
		app.testing = True
		self.client = app.test_client()

	# Complete the function below to test a success in running the application
	def test_prediction_route_success(self):
		response = self.client.get('/')
		# The app must start and answer the home route with HTTP 200 OK
		self.assertEqual(response.status_code, 200)

	# Complete the function below to test a form is rendered
	def test_get_form(self):
		response = self.client.get('/')
		html = response.data.decode('utf-8')
		# The input form page must be rendered with a POST form and its fields
		self.assertIn('<form', html)
		self.assertIn('method="POST"', html)
		self.assertIn('Weather Classification', html)
		for field in ['temperature', 'pressure', 'humidity', 'wind_speed', 'wind_deg']:
			self.assertIn(f'name="{field}"', html)

if __name__ == '__main__':
	unittest.main()
