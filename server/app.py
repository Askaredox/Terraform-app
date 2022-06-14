from flask import Flask, request
from flask_cors import CORS

app = Flask(__name__)
cors = CORS(app, resources={r"/*": {"origin": "*"}})

@app.route('/')
def check():
    return "<h1>Software Avanzado - Terraform - 201612272 - Andres Carvajal</h1>"
    
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000, threaded=True, use_reloader=True)


