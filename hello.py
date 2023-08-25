from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def principal():
    return render_template('index.html')

# @app.route("/login")
# def login():
#     return "hola mundo"


if __name__ == '__main__':
    app.run(debug=True)
