from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/',methods=['GET'])
def main():
    data = request.args.get('ip')
    with open('ip.txt', 'w') as f:
        f.write(str(data))
    return render_template('index2.html')
    
if __name__ == '__main__':
    app.run(host='0.0.0.0',port='8080')
