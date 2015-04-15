__author__ = 'Xin Huang'
from flask import Flask
from flask.ext.restless import APIManager


def create_app(config_filename):
    app = Flask(__name__)
    app.config.from_pyfile(config_filename)
    from pcos.model import db, Clinician, SecurityUser
    db.init_app(app)

    with app.test_request_context():
        from pcos.auth import check_auth
        pre_dict = {'POST': [check_auth],
                    'GET_SINGLE': [check_auth],
                    'GET_MANY': [check_auth],
                    'PATCH_SINGLE': [check_auth],
                    'PATCH_MANY': [check_auth],
                    'DELETE_SINGLE': [check_auth],
                    'DELETE_MANY': [check_auth]}
        manager = APIManager(app, flask_sqlalchemy_db=db, preprocessors=pre_dict)
        manager.create_api(Clinician, methods=['GET', 'POST', 'DELETE'])
        manager.create_api(SecurityUser, methods=['GET', 'POST', 'DELETE'])

    return app