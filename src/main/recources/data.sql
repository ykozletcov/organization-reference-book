INSERT INTO position_list VALUES ('директор');
INSERT INTO position_list VALUES ('менеджер по продажам');
INSERT INTO position_list VALUES ('администратор');

INSERT INTO doc_list(name, code) VALUES ('паспорт гражданина Российской Федерации', '21');
INSERT INTO doc_list(name, code) VALUES ('паспорт иностранного гражданина', '10');
INSERT INTO doc_list(name, code) VALUES ('свидетельство о рождении', '03');

INSERT INTO country_list(name, code) VALUES ('Российская Федерация', '643');
INSERT INTO country_list(name, code) VALUES ('Республика Беларусь', '112');
INSERT INTO country_list(name, code) VALUES ('Федеративная Республика Германия', '276');

INSERT INTO organization (name, full_name, inn, kpp, address, phone, is_active)
        VALUES ('Перспектива','ООО "Перспектива"','645400001111','656500111','г.Саратов, ул.Челюскинцев, 1','+7(8452)112-223',1);

INSERT INTO organization (name, full_name, inn, kpp, address, phone, is_active)
        VALUES ('Сателлит+','ООО "Сателлит Плюс"','645400002222','656500222','г.Саратов, ул.Тархова, 10','+7(8452)234-654',0);

INSERT INTO office (name, address, phone, organization_id, is_active)
        VALUES ('Перспектива','г.Саратов, ул.Челюскинцев, 1','+7(8452)112-223',1,1);

INSERT INTO office (name, address, phone, organization_id, is_active)
        VALUES ('Перспектива','г.Саратов, ул.2-я Садовая, 12','+7(8452)555-012',1,1);

INSERT INTO office (name, address, phone, organization_id, is_active)
        VALUES ('Сателлит+','г.Саратов, ул.Тархова, 10','+7(8452)234-654',2,0);

INSERT INTO doc (doc_list_id, number, date) VALUES (1,'6305 136758', '21.01.2008');
INSERT INTO doc (doc_list_id, number, date) VALUES (1,'6404 857413', '01.02.2003');

INSERT INTO employee (first_name, middle_name, last_name, position_id, doc_id, citizenship_id, office_id, is_identified)
        VALUES ('Иван','Федорович','Крузенштерн',1,1,1,1,1);

INSERT INTO employee (first_name, middle_name, last_name, position_id, doc_id, citizenship_id, office_id, is_identified)
        VALUES ('Николай','Александрович','Романов',1,2,1,2,1);




