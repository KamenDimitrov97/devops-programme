import os

from flask import Flask
import sys

app = Flask(__name__)


@app.route("/")
def hello_world():
    return "Wassup!"


if __name__ == "__main__":
    app.run()
