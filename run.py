__author__ = 'Xin Huang'
import os

from pcos import create_app


if __name__ == '__main__':
    app = create_app(os.getcwd() + '/config.py')
    app.run()