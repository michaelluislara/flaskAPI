from flask_api import FlaskAPI
import downloader

app = FlaskAPI(__name__)

@app.route('/')
def example():
    return downloader.downloaddata()
if __name__ == "__main__":
   # run the flask app
   app.run()