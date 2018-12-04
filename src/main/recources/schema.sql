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

CREATE INDEX IX_organization_name           ON organization(name);
CREATE INDEX IX_organization_full_name      ON organization(full_name);
CREATE UNIQUE INDEX UX_organization_inn     ON organization(inn);
CREATE UNIQUE INDEX UX_organization_kpp     ON organization(kpp);
CREATE INDEX IX_organization_address        ON organization(address);
CREATE INDEX IX_organization_phone          ON organization(phone);
CREATE INDEX IX_organization_is_active      ON organization(is_active);

COMMENT ON TABLE organization               IS 'информация о компаниях';
COMMENT ON COLUMN organization.id           IS 'уникальный идентификатор компании';
COMMENT ON COLUMN organization.name         IS 'название компании';
COMMENT ON COLUMN organization.full_name    IS 'полное название компании';
COMMENT ON COLUMN organization.inn          IS 'ИНН компании';
COMMENT ON COLUMN organization.kpp          IS 'КПП компании';
COMMENT ON COLUMN organization.address      IS 'юридический адрес компании';
COMMENT ON COLUMN organization.phone        IS 'телефонный номер компании';
COMMENT ON COLUMN organization.is_active    IS 'активность компании';



CREATE IF NOT EXISTS office (
    id              INTEGER PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(100)    NOT NULL,
    address         VARCHAR(120)    NOT NULL,
    phone           VARCHAR(18),
    organization_id INTEGER         NOT NULL,
    is_active       SMALLINT
);
ALTER TABLE office      ADD FOREIGN KEY organization_id     REFERENCES organization(id);

CREATE INDEX IX_office_name                 ON office(name);
CREATE INDEX IX_office_phone                ON office(phone);
CREATE INDEX IX_office_address              ON office(address);
CREATE INDEX IX_office_is_active            ON office(is_active);

COMMENT ON TABLE office                     IS 'информация об офисах';
COMMENT ON COLUMN office.id                 IS 'уникальный идентификатор офиса';
COMMENT ON COLUMN office.name               IS 'название офиса';
COMMENT ON COLUMN office.address            IS 'адрес офиса';
COMMENT ON COLUMN office.phone              IS 'телефонный номер офиса';
COMMENT ON COLUMN office.organization_id    IS 'внешний ключ - принадлежность организации';
COMMENT ON COLUMN office.is_active          IS 'активность офиса';



CREATE IF NOT EXISTS employee (
    id              INTEGER PRIMARY KEY AUTO_INCREMENT,
    first_name      VARCHAR(50)     NOT NULL,
    middle_name     VARCHAR(50),
    second_name     VARCHAR(50),
    last_name       VARCHAR(50)     NOT NULL,
    position_id     INTEGER         NOT NULL,
    phone           VARCHAR(18),
    doc_id          INTEGER         NOT NULL,
    citizenship_id  INTEGER         NOT NULL,
    office_id       INTEGER         NOT NULL,
    is_identified   SMALLINT
);
ALTER TABLE employee    ADD FOREIGN KEY doc_id              REFERENCES doc(id);
ALTER TABLE employee    ADD FOREIGN KEY citizenship_id      REFERENCES country_list(id);
ALTER TABLE employee    ADD FOREIGN KEY office_id           REFERENCES office(id);

CREATE INDEX IX_employee_first_name         ON employee(first_name);
CREATE INDEX IX_employee_middle_name        ON employee(middle_name);
CREATE INDEX IX_employee_second_name        ON employee(second_name);
CREATE INDEX IX_employee_last_name          ON employee(last_name);
CREATE INDEX IX_employee_position_id        ON employee(position_id);
CREATE INDEX IX_employee_phone              ON employee(phone);
CREATE INDEX IX_employee_doc_id             ON employee(doc_id);
CREATE INDEX IX_employee_citizenship_id     ON employee(citizenship_id);
CREATE INDEX IX_employee_office_id          ON employee(office_id);
CREATE INDEX IX_employee_is_identified      ON employee(is_identified);

COMMENT ON TABLE employee                   IS 'информация о сотрудниках';
COMMENT ON COLUMN employee.id               IS 'уникальный идентификатор офиса';
COMMENT ON COLUMN employee.first_name       IS 'имя сотрудника';
COMMENT ON COLUMN employee.middle_name      IS 'отчество сотрудника (для стран СНГ)';
COMMENT ON COLUMN employee.second_name      IS 'второе имя сотрудника (для англоговорящих стран)';
COMMENT ON COLUMN employee.last_name        IS 'фамилия сотрудника';
COMMENT ON COLUMN employee.position_id      IS 'внешний ключ - должность сотрудника';
COMMENT ON COLUMN employee.phone            IS 'телефонный номер сотрудника';
COMMENT ON COLUMN employee.doc_id           IS 'внешний ключ - документ сотрудника';
COMMENT ON COLUMN employee.citizenship_id   IS 'внешний ключ - гражданство сотрудника';
COMMENT ON COLUMN employee.office_id        IS 'внешний ключ - принадлежность офису';
COMMENT ON COLUMN employee.is_identified    IS 'идентификация сотрудника';



CREATE IF NOT EXISTS doc (
    id              INTEGER PRIMARY KEY AUTO_INCREMENT,
    doc_list_id     INTEGER         NOT NULL,
    number          VARCHAR(15)     NOT NULL,
    date            VARCHAR(10)     NOT NULL,
);
ALTER TABLE doc         ADD FOREIGN KEY doc_list_id         REFERENCES doc_list(id);

CREATE INDEX IX_doc_doc_list_id             ON doc(doc_number);
CREATE INDEX IX_doc_number                  ON doc(doc_number);
CREATE INDEX IX_doc_date                    ON doc(doc_date);

COMMENT ON TABLE doc                        IS 'информация о документах сотрудников';
COMMENT ON COLUMN doc.id                    IS 'уникальный идентификатор документа';
COMMENT ON COLUMN doc.doc_list_id           IS 'внешний ключ - вид документа';
COMMENT ON COLUMN doc.number                IS 'номер документа';
COMMENT ON COLUMN doc.date                  IS 'дата выдачи документа';

CREATE IF NOT EXISTS position_list (
    id              INTEGER PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(50)     NOT NULL
);

COMMENT ON TABLE position_list              IS 'справочник должностей сотрудников';
COMMENT ON COLUMN position_list.id          IS 'уникальный идентификатор должности';
COMMENT ON COLUMN position_list.name        IS 'название должности';



CREATE IF NOT EXISTS doc_list (
    id              INTEGER PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(50)     NOT NULL,
    code            VARCHAR(3)      NOT NULL
);

CREATE UNIQUE INDEX UX_doc_list_name        ON doc_list(name);
CREATE UNIQUE INDEX UX_doc_list_code        ON doc_list(code);

COMMENT ON TABLE doc_list                   IS 'справочник документов';
COMMENT ON COLUMN doc_list.id               IS 'уникальный идентификатор документа';
COMMENT ON COLUMN doc_list.name             IS 'название документа';
COMMENT ON COLUMN doc_list.code             IS 'код документа';

CREATE IF NOT EXISTS country_list (
    id              INTEGER PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(50)     NOT NULL,
    code            VARCHAR(4)      NOT NULL
);

CREATE UNIQUE INDEX UX_country_list_name    ON country_list(name);
CREATE UNIQUE INDEX UX_country_list_code    ON country_list(code);

COMMENT ON TABLE country_list               IS 'справочник стран';
COMMENT ON COLUMN country_list.id           IS 'уникальный идентификатор страны';
COMMENT ON COLUMN country_list.name         IS 'название страны';
COMMENT ON COLUMN country_list.code         IS 'код страны';