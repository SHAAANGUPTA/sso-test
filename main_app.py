from flask import Flask, render_template, request, session


LOCAL = False


class Config:
    
    if not LOCAL:
        URL_PREFIX = ('https://sales-performancetesting.test.peak.ai/'
                      'app_direct/default')
    else:
        URL_PREFIX = ''
    
    PORT = 8050

app = Flask(__name__)
app.config.from_object(Config)
app.jinja_env.globals.update(url_base=app.config['URL_PREFIX'])


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
    app.run(debug=True, 
            port=8050,
            host='0.0.0.0')
            