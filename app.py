from flask_api import FlaskAPI
from flask import request, Flask
import os
import giver
from markupsafe import escape

app = Flask(__name__)

API_KEY = os.environ['API_KEY']

@app.route('/')
def example():
    """
    Helper function to send the data to the requestor.
    """
    api_key = escape(request.headers.get("Authorization"))
    if api_key == API_KEY:
        return giver.givedata()
    else:
        return "Unauthorized", 401
if __name__ == "__main__":
   # run the flask app
   app.run()