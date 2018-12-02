CREATE IF NOT EXISTS organization (
    id              INTEGER PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(100)    NOT NULL,
    full_name       VARCHAR(100)    NOT NULL,
    inn             VARCHAR(12)     NOT NULL,
    kpp             VARCHAR(9)      NOT NULL,
    address         VARCHAR (120)   NOT NULL,
    phone           VARCHAR(18),
    is_active       SMALLINT
);

CREATE IF NOT EXISTS office (
    id              INTEGER PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(100)    NOT NULL,
    address         VARCHAR(120)    NOT NULL,
    phone           VARCHAR(18),
    organization_id INTEGER         NOT NULL,
    is_active       SMALLINT
);

CREATE IF NOT EXISTS employee (
    id              INTEGER PRIMARY KEY AUTO_INCREMENT,
    first_name      VARCHAR(50)     NOT NULL,
    middle_name     VARCHAR(50),
    second_name     VARCHAR(50),
    last_name       VARCHAR(50)     NOT NULL,
    position_id     INTEGER         NOT NULL,
    phone           VARCHAR(18),
    doc_code        VARCHAR(3),
    doc_number      VARCHAR(15),
    doc_date        VARCHAR(10),
    citizenship_code VARCHAR(4),
    office_id       INTEGER         NOT NULL,
    is_identified   SMALLINT
);

CREATE IF NOT EXISTS position (
    id              INTEGER PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(50)     NOT NULL
);

CREATE IF NOT EXISTS doc (
    id              INTEGER PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(50)     NOT NULL,
    code            VARCHAR(3)      NOT NULL
);

CREATE IF NOT EXISTS country (
    id              INTEGER PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(50)     NOT NULL,
    code            VARCHAR(4)      NOT NULL
);

ALTER TABLE office      ADD FOREIGN KEY organization_id     REFERENCES organization(id);
ALTER TABLE employee    ADD FOREIGN KEY office_id           REFERENCES office(id);
ALTER TABLE employee    ADD FOREIGN KEY doc_code            REFERENCES doc(code);
ALTER TABLE employee    ADD FOREIGN KEY citizenship_code    REFERENCES country(code);

CREATE INDEX IX_organization_name           ON organization(name);
CREATE INDEX IX_organization_full_name      ON organization(full_name);
CREATE UNIQUE INDEX UX_organization_inn     ON organization(inn);
CREATE UNIQUE INDEX UX_organization_kpp     ON organization(kpp);
CREATE INDEX IX_organization_address        ON organization(address);
CREATE INDEX IX_organization_phone          ON organization(phone);
CREATE INDEX IX_organization_is_active      ON organization(is_active);

CREATE INDEX IX_office_name                 ON office(name);
CREATE INDEX IX_office_phone                ON office(phone);
CREATE INDEX IX_office_address              ON office(address);
CREATE INDEX IX_office_is_active            ON office(is_active);

CREATE INDEX IX_employee_first_name         ON employee(first_name);
CREATE INDEX IX_employee_middle_name        ON employee(middle_name);
CREATE INDEX IX_employee_second_name        ON employee(second_name);
CREATE INDEX IX_employee_last_name          ON employee(last_name);
CREATE INDEX IX_employee_position           ON employee(position);
CREATE INDEX IX_employee_phone              ON employee(phone);
CREATE INDEX IX_employee_doc_code           ON employee(doc_code);
CREATE UNIQUE INDEX IX_employee_doc_number  ON employee(doc_number);
CREATE INDEX IX_employee_doc_date           ON employee(doc_date);
CREATE INDEX IX_employee_citizenship_code   ON employee(citizenship_code);
CREATE INDEX IX_employee_is_identified      ON employee(is_identified);

CREATE INDEX IX_doc_name                    ON doc(name);
CREATE UNIQUE INDEX IX_doc_code             ON doc(code);

CREATE INDEX IX_country_name                ON country(name);
CREATE UNIQUE INDEX IX_country_code         ON country(code);

COMMENT ON TABLE organization               IS 'информация о компаниях';
COMMENT ON COLUMN organization.id           IS 'уникальный идентификатор компании';
COMMENT ON COLUMN organization.name         IS 'название компании';
COMMENT ON COLUMN organization.full_name    IS 'полное название компании';
COMMENT ON COLUMN organization.inn          IS 'ИНН компании';
COMMENT ON COLUMN organization.kpp          IS 'КПП компании';
COMMENT ON COLUMN organization.address      IS 'юридический адрес компании';
COMMENT ON COLUMN organization.phone        IS 'телефонный номер компании';
COMMENT ON COLUMN organization.is_active    IS 'активность компании';

COMMENT ON TABLE office                     IS 'информация об офисах';
COMMENT ON COLUMN office.id                 IS 'уникальный идентификатор офиса';
COMMENT ON COLUMN office.name               IS 'название офиса';
COMMENT ON COLUMN office.address            IS 'адрес офиса';
COMMENT ON COLUMN office.phone              IS 'телефонный номер офиса';
COMMENT ON COLUMN office.organization_id    IS 'внешний ключ - принадлежность организации';
COMMENT ON COLUMN office.is_active          IS 'активность офиса';

COMMENT ON TABLE employee                   IS 'информация о сотрудниках';
COMMENT ON COLUMN employee.id               IS 'уникальный идентификатор офиса';
COMMENT ON COLUMN employee.first_name       IS 'имя сотрудника';
COMMENT ON COLUMN employee.middle_name      IS 'отчество сотрудника (для стран СНГ)';
COMMENT ON COLUMN employee.second_name      IS 'второе имя сотрудника (для англоговорящих стран)';
COMMENT ON COLUMN employee.last_name        IS 'фамилия сотрудника';
COMMENT ON COLUMN employee.position_id      IS 'внешний ключ - должность сотрудника';
COMMENT ON COLUMN employee.phone            IS 'телефонный номер сотрудника';
COMMENT ON COLUMN employee.doc_code         IS 'внешний ключ - код документа сотрудника';
COMMENT ON COLUMN employee.doc_number       IS 'номер документа сотрудника';
COMMENT ON COLUMN employee.doc_date         IS 'дата выдачи документа';
COMMENT ON COLUMN employee.citizenship_code IS 'гражданство сотрудника';
COMMENT ON COLUMN employee.office_id        IS 'внешний ключ - принадлежность офису';
COMMENT ON COLUMN employee.is_identified    IS 'идентификация сотрудника';

COMMENT ON TABLE position                   IS 'справочник должностей сотрудников';
COMMENT ON COLUMN position.id               IS 'уникальный идентификатор должности';
COMMENT ON COLUMN position.name             IS 'название должности';

COMMENT ON TABLE doc                        IS 'справочник документов';
COMMENT ON COLUMN doc.id                    IS 'уникальный идентификатор документа';
COMMENT ON COLUMN doc.name                  IS 'название документа';
COMMENT ON COLUMN doc.code                  IS 'код документа';

COMMENT ON TABLE country                    IS 'справочник стран';
COMMENT ON COLUMN country.id                IS 'уникальный идентификатор страны';
COMMENT ON COLUMN country.name              IS 'название страны';
COMMENT ON COLUMN country.code              IS 'код страны';