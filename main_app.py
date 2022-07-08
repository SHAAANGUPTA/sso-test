from flask import Flask, render_template, request, session


app = Flask(__name__)

@app.route('/', methods=['GET'])
def home():
    cookie_data = request.cookies
    print("Cookies", cookie_data)
    return render_template('homepage.html',
                           cookie_data=cookie_data)


@app.route('/some_other_page', methods=['GET'])
def other_page():
    return render_template('other_page.html')


if __name__ == '__main__':
    app.run(debug=True, port='8050',
            host='0.0.0.0')