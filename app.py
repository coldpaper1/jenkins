from flask import Flask
app = Flask(__name__)

print("1)


@app.route('/')
def index():
	return '<h1>Hello world!!</h1>'
    

    
if __name__ == '__main__':
	app.run('0.0.0.0',port=5000,debug=True)
    
