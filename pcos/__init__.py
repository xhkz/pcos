__author__ = 'Xin Huang'
from flask import Flask, request, jsonify

from flask.ext.restless import APIManager
from flask.ext.login import login_user

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
    manager = APIManager(app, flask_sqlalchemy_db=db, preprocessors=pre_dict)
    manager.create_api(Clinician, methods=['GET', 'POST', 'DELETE'])
    manager.create_api(ClinicalReview, methods=['GET', 'POST', 'DELETE'])
    manager.create_api(Investigation, methods=['GET', 'POST', 'DELETE'])
    manager.create_api(MedicalHistory, methods=['GET', 'POST', 'DELETE'])
    manager.create_api(MedicationRecord, methods=['GET', 'POST', 'DELETE'])
    manager.create_api(Observation, methods=['GET', 'POST', 'DELETE'])
    manager.create_api(Patient, methods=['GET', 'POST', 'DELETE'])
    manager.create_api(PregnancyHistory, methods=['GET', 'POST', 'DELETE'])
    manager.create_api(Questionnaire, methods=['GET', 'POST', 'DELETE'])
    manager.create_api(SecurityUser, methods=['GET', 'POST', 'DELETE'])


@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data['email']
    matches = SecurityUser.query.filter_by(email=email).all()
    if len(matches) > 0:
        user = matches[0]
        login_user(user)
        return jsonify({"result": "success", "name": user.name})

    return jsonify({"result": "fail"})