from flask import Flask
import redis

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"


""" r = redis.Redis(
    host='hostname',
    port=port, 
    password='password')

value = r.get('foo')
print(value)
 """




