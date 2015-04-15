__author__ = 'Xin Huang'
from flask.ext.sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Clinician(db.Model):
    id = db.Column(db.BIGINT, primary_key=True, autoincrement=True)
    user_id = db.Column(db.BIGINT, db.ForeignKey('securityuser.id'), unique=True, nullable=False)
    first_name = db.Column(db.VARCHAR, nullable=False)
    last_name = db.Column(db.VARCHAR, nullable=False)


class ClinicalReview(db.Model):
    id = db.Column(db.BIGINT, primary_key=True, autoincrement=True)
    doa = db.Column(db.DATETIME)
    eh_body = db.Column(db.VARCHAR)
    eh_face = db.Column(db.VARCHAR)
    exm_acanthosis_nigricans = db.Column(db.SMALLINT)
    exm_acne = db.Column(db.SMALLINT)
    exm_androgenetic_alopecia = db.Column(db.SMALLINT)
    exm_hirsutism = db.Column(db.SMALLINT)
    exm_lipodystrophy = db.Column(db.SMALLINT)
    rr_oligo = db.Column(db.SMALLINT)
    rr_hirsutism = db.Column(db.SMALLINT)
    rr_acne = db.Column(db.SMALLINT)
    rr_hard_conceive = db.Column(db.SMALLINT)
    rr_weight_gain = db.Column(db.SMALLINT)
    rr_other = db.Column(db.VARCHAR)
    pt_yasmin = db.Column(db.SMALLINT)
    pt_dianette = db.Column(db.SMALLINT)
    pt_other_ocp = db.Column(db.SMALLINT)
    pt_metformin = db.Column(db.SMALLINT)
    pt_medroxy_acetate = db.Column(db.SMALLINT)
    pt_clomiphene = db.Column(db.SMALLINT)
    pt_other = db.Column(db.VARCHAR)
    fh_dc_who = db.Column(db.VARCHAR)
    fh_diabetes = db.Column(db.SMALLINT)
    fh_diabetes_who = db.Column(db.VARCHAR)
    fh_difficulties_conceiv = db.Column(db.SMALLINT)
    fh_hbp = db.Column(db.SMALLINT)
    fh_hbp_who = db.Column(db.VARCHAR)
    fh_hd_who = db.Column(db.VARCHAR)
    fh_heart_disease = db.Column(db.SMALLINT)
    fh_hirsutism = db.Column(db.SMALLINT)
    fh_hirsutism_who = db.Column(db.VARCHAR)
    fh_irregular_periods = db.Column(db.SMALLINT)
    fh_irrper_who = db.Column(db.VARCHAR)
    fh_obesity = db.Column(db.SMALLINT)
    fh_obesity_who = db.Column(db.VARCHAR)
    fh_stroke = db.Column(db.SMALLINT)
    fh_stroke_who = db.Column(db.VARCHAR)
    fh_other = db.Column(db.VARCHAR)
    impression = db.Column(db.VARCHAR)
    pbwlb = db.Column(db.DECIMAL)
    pbwp = db.Column(db.DECIMAL)
    birth_weight = db.Column(db.DECIMAL)
    patient_id = db.Column(db.BIGINT, db.ForeignKey('patient.id'), nullable=False)


class Investigation(db.Model):
    pass


class MedicalHistory(db.Model):
    pass


class MedicationRecord(db.Model):
    pass


class Observation(db.Model):
    pass


class Patient(db.Model):
    pass


class PregnancyHistory(db.Model):
    pass


class Questionnaire(db.Model):
    pass


class SecurityUser(db.Model):
    id = db.Column(db.BIGINT, primary_key=True, autoincrement=True)
    email = db.Column(db.VARCHAR, unique=True, nullable=False)
    password = db.Column(db.VARCHAR, nullable=False)
    name = db.Column(db.VARCHAR, nullable=False)
    role = db.Column(db.VARCHAR)