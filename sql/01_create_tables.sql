-- SQL Script to Create Tables for Clinical Trial Database

PRAGMA foreign_keys = ON;

-- =========================
-- Sites (1 row per site)
-- =========================
CREATE TABLE sites (
    site_id TEXT NOT NULL PRIMARY KEY,
    region TEXT,
    site_size TEXT,
    urbanicity TEXT,
    site_quality_index REAL
);

-- =========================
-- Patients (1 row per patient)
-- =========================
CREATE TABLE patients (
    patient_id TEXT NOT NULL PRIMARY KEY,
    site_id TEXT,
    enroll_date TEXT,
    sex TEXT,
    age INTEGER,
    bmi REAL,
    smoker INTEGER,
    comorbidity_count INTEGER,
    baseline_severity REAL,
    crp_mgL REAL,
    alt_U_L REAL,
    egfr_ml_min REAL,
    self_reported_adherence REAL,
    treatment_arm TEXT,
    FOREIGN KEY (site_id) REFERENCES sites(site_id)
);

-- =========================
-- Visits (1 row per patient per visit)
-- =========================
CREATE TABLE visits (
    patient_id TEXT NOT NULL,
    site_id TEXT,
    treatment_arm TEXT,
    visit_num INTEGER NOT NULL,
    visit_date TEXT,
    days_from_enroll INTEGER,
    med_adherence REAL,
    adverse_event_flag INTEGER,
    severity_score REAL,
    crp_mgL REAL,
    alt_U_L REAL,
    egfr_ml_min REAL,
    dropout_flag INTEGER,
    PRIMARY KEY (patient_id, visit_num),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (site_id) REFERENCES sites(site_id)
);

-- =========================
-- Outcomes (1 row per patient, labels only)
-- =========================
CREATE TABLE outcomes (
    patient_id TEXT NOT NULL PRIMARY KEY,
    last_visit_num INTEGER,
    last_days_from_enroll INTEGER,
    pct_improvement_severity REAL,
    serious_ae_flag INTEGER,
    responder_30pct INTEGER,
    qol_score REAL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- =========================
-- Notes (1 row per patient per visit)
-- =========================
CREATE TABLE notes (
    patient_id TEXT NOT NULL,
    visit_num INTEGER,
    note_tone_label TEXT,
    clinical_note TEXT,
    PRIMARY KEY (patient_id, visit_num),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
