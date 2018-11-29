CREATE IF NOT EXISTS organization (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    inn VARCHAR(12) NOT NULL,
    kpp VARCHAR(9) NOT NULL,
    address VARCHAR (120) NOT NULL,
    phone VARCHAR(18) NOT NULL,
    is_active SMALLINT
);

CREATE IF NOT EXISTS office (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(18) NOT NULL,
    organization_id INTEGER NOT NULL,
    is_active SMALLINT
);

CREATE IF NOT EXISTS employee (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    second_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    phone VARCHAR(18),
    doc_code VARCHAR(3) NOT NULL,
    doc_number VARCHAR(15) NOT NULL,
    doc_date VARCHAR(10) NOT NULL,
    citizenship_name VARCHAR(50) NOT NULL,
    citizenship_code VARCHAR(4) NOT NULL,
    office_id INTEGER NOT NULL,
    is_identified SMALLINT
);

CREATE IF NOT EXISTS doc (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    code VARCHAR(3) NOT NULL
);

CREATE IF NOT EXISTS country (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    code VARCHAR(4) NOT NULL
);

ALTER TABLE office ADD FOREIGN KEY organization_id REFERENCES organization(id);
ALTER TABLE employee ADD FOREIGN KEY doc_code REFERENCES doc(code);
ALTER TABLE employee ADD FOREIGN KEY citizenship_code REFERENCES country(code);





