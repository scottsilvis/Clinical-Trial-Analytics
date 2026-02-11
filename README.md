# Clinical Trial Analytics & Machine Learning Pipeline (Synthetic Data)
## Overview

This project demonstrates an end-to-end data science workflow using a realistic, fully synthetic clinical trial dataset.

The goal is to mirror how a data scientist would approach messy, longitudinal, multi-table data and translate it into predictive models and actionable insights using modern analytics and machine-learning tools.

The dataset is entirely synthetic and was generated programmatically to reflect realistic clinical, operational, and behavioral patterns while preserving privacy.

---

## Objectives

- Perform exploratory data analysis (EDA) on relational clinical data
- Engineer features from longitudinal measurements
- Build reproducible machine-learning pipelines 
- Compare baseline statistical models with tree-based ensemble methods
- Evaluate models using industry-standard metrics
- Interpret results and communicate findings clearly

---

## Dataset Description

The project consists of five CSV files representing a simplified clinical trial ecosystem.

### 1. patients.csv — Baseline Patient Data
    
One row per patient with demographics, baseline labs, and treatment assignment.
    
**Key variables**
- Demographics: age, sex, bmi, smoker
- Clinical: baseline_severity, crp_mgL, alt_U_L, egfr_ml_min
- Operational: site_id, treatment_arm
- Behavioral: self_reported_adherence

---

### 2. visits.csv — Longitudinal Visit Data

Multiple rows per patient capturing repeated measurements over time.

Key variables:
- Time: visit_num, days_from_enroll
- Outcomes: severity_score
- Labs over time: crp_mgL, alt_U_L, egfr_ml_min
- Safety & behavior: med_adherence, adverse_event_flag, dropout_flag

---

### 3. outcomes.csv — Patient-Level Targets

Derived outcomes based on each patient’s final observed visit.

Key variables:
- responder_30pct — binary clinical response indicator
- pct_improvement_severity — continuous outcome
- serious_ae_flag — safety outcome
- qol_score — quality-of-life proxy

---

### 4. sites.csv — Clinical Site Metadata

Operational characteristics of enrollment sites.

Key variables:
- region, site_size, urbanicity
- site_quality_index — observable proxy for site-level effects

---

### 5. notes.csv — Synthetic Clinical Notes (Optional NLP Extension)

Short free-text visit notes with labeled tone.

Key variables:
- clinical_note
- note_tone_label (positive / neutral / negative)

---

## Project Structure

```
.
├── data/
│   ├── patients.csv
│   ├── visits.csv
│   ├── outcomes.csv
│   ├── sites.csv
│   └── notes.csv
│
├── r/
│   ├── 02_exploratory_data_analysis.md
│   ├── 03_feature_engineering.md
|
├── sql/
│   ├── 01_create_tables.sql
│   └── 02_create_feature_views.sql
|
├── python/
│   ├── 05_model_training.ipynb
│   └── 06_model_evaluation.ipynb
│
├── README.md
└── requirements.txt
```

(File names are suggestions; structure may vary.)

---

## Modeling Approach

### Feature Engineering

Longitudinal visit data is aggregated to patient-level features, including:

- Visit counts and dropout indicators
- Adherence summaries (mean, minimum)
- Symptom trajectories (slopes, deltas)
- Laboratory trends and extrema
- Adverse event summaries

This reflects a common real-world task: converting time-series clinical data into tabular, ML-ready features.

---

### Models

Two supervised models are trained and compared:

#### Logistic Regression
- Baseline, interpretable benchmark
- Standardized features

#### Gradient Boosting
- Nonlinear, high-performance model
- Captures interactions and patient heterogeneity

## Evaluation Metrics
- ROC–AUC
- Precision / Recall
- Confusion Matrix
- Feature importance (tree-based models)

## Key Skills Demonstrated
    
- Exploratory Data Analysis (EDA)
- Feature engineering from longitudinal data
- Train / validation / test workflows
- Machine learning pipelines (scikit-learn)
- Model comparison and interpretation
- Handling missingness and dropout
- Clear communication of analytical results

## Notes on Synthetic Data
    
- All data is fully simulated
- No real patients, institutions, or medications are represented
- Patterns were intentionally embedded to allow meaningful discovery without being trivial

## Possible Extensions

- Time-to-event (survival) modeling
- Mixed-effects or hierarchical models
- NLP modeling on clinical notes
- Model deployment (API or dashboard)
- Fairness and subgroup analysis

## Disclaimer

This project is for educational and demonstration purposes only.
It does not represent real clinical evidence and should not be used for medical decision-making.
