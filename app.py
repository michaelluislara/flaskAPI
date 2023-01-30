from flask_api import FlaskAPI
import giver

app = FlaskAPI(__name__)

@app.route('/')
def example():
    """
    Helper function to send the data to the requestor.
    """
    return giver.givedata()
if __name__ == "__main__":
   # run the flask app
   app.run()