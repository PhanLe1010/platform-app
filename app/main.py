from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def home():
    env = os.getenv('APP_ENV', 'unknown')
    version = os.getenv('APP_VERSION', 'v0')
    return f'Hello from platform-app! env={env} version={version}\n'

@app.route('/health')
def health():
    return 'ok\n', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)