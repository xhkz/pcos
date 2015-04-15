__author__ = 'Xin Huang'
from flask.ext.sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Clinician(db.Model):
    id = db.Column(db.BIGINT, primary_key=True, autoincrement=True)
    user_id = db.Column(db.BIGINT, unique=True, nullable=False)
    first_name = db.Column(db.VARCHAR, nullable=False)
    last_name = db.Column(db.VARCHAR, nullable=False)


class SecurityUser(db.Model):
    id = db.Column(db.BIGINT, primary_key=True, autoincrement=True)
    email = db.Column(db.VARCHAR, unique=True, nullable=False)
    password = db.Column(db.VARCHAR, nullable=False)
    name = db.Column(db.VARCHAR, nullable=False)
    role = db.Column(db.VARCHAR)