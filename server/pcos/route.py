from flask import request, jsonify

from flask.ext.login import login_user

from pcos import app, SecurityUser, Patient


@app.route('/login_security', methods=['POST'])
def login_security():
    data = request.get_json()
    email = data['email']
    password = data['password']
    matches = SecurityUser.query.filter_by(email=email, password=password).all()
    if len(matches) > 0:
        user = matches[0]
        login_user(user)
        return jsonify({'result': 'success', 'name': user.name})

    return jsonify({'result': 'fail'})


@app.route('/check', methods=['POST'])
def check():
    data = request.get_json()
    first_name = data['first_name']
    last_name = data['last_name']
    email = data['email']
    date_of_birth = data['dob']
    matches = Patient.query.filter_by(first_name=first_name,
                                      last_name=last_name,
                                      email=email,
                                      date_of_birth=date_of_birth).all()
    if len(matches) > 0:
        return jsonify({'result': 'success', 'message': 'Found.', 'patient_id': matches[0].id})

    return jsonify({'result': 'fail', 'message': 'No matching patient found.'})