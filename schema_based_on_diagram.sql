-- Create the "patients" table
CREATE TABLE patients (
    id serial PRIMARY KEY,
    name varchar,
    date_of_birth date
);

-- Create the "medical_histories" table with a foreign key reference to "patients"
CREATE TABLE medical_histories (
    id serial PRIMARY KEY,
    admitted_at timestamp,
    patient_id int,
    status varchar,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

-- Create the "invoices" table with a foreign key reference to "medical_histories"
CREATE TABLE invoices (
    id serial PRIMARY KEY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

-- Create the "treatments" table
CREATE TABLE treatments (
    id serial PRIMARY KEY,
    type varchar,
    name varchar
);

-- Create the "invoice_items" table with foreign key references to "invoices" and "treatments"
CREATE TABLE invoice_items (
    id serial PRIMARY KEY,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    treatment_id int,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

-- Create the "med_hist_treat" table with foreign key references to "medical_histories" and "treatments"
-- CREATE TABLE med_hist_treat (
--     id serial PRIMARY KEY,
--     med_hist_id int,
--     treatment_id int,
--     FOREIGN KEY (med_hist_id) REFERENCES medical_histories(id),
--     FOREIGN KEY (treatment_id) REFERENCES treatments(id)
-- );