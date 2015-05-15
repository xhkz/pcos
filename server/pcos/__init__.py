__author__ = 'Xin Huang'
from flask import Flask
from flask.ext.restless import APIManager

from pcos.auth import check_auth, login_manager
from pcos.model import *


app = Flask(__name__)
app.config.from_pyfile('config.py')
db.init_app(app)
login_manager.init_app(app)

with app.test_request_context():
    pre_dict = {'POST': [check_auth],
                'GET_SINGLE': [check_auth],
                'GET_MANY': [check_auth],
                'PATCH_SINGLE': [check_auth],
                'PATCH_MANY': [check_auth],
                'DELETE_SINGLE': [check_auth],
                'DELETE_MANY': [check_auth]}

    manager = APIManager(app, flask_sqlalchemy_db=db)
    manager.create_api(Clinician, methods=['GET', 'POST', 'DELETE'], preprocessors=pre_dict)
    manager.create_api(Patient, methods=['GET', 'POST', 'DELETE'], preprocessors=pre_dict)
    manager.create_api(SecurityUser, methods=['GET', 'POST', 'DELETE'], preprocessors=pre_dict)
    manager.create_api(Questionnaire, methods=['GET', 'POST'])
    manager.create_api(Appointment, methods=['GET', 'PATCH'])

    from .route import *

