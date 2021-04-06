person('Пупкин', '+79991112233', address('Новосибирск', 'Ленина', 22, 6)).
person('Пупкин', '+79139990011', address('Бердск', 'Сокол', 10, 3)).
person('Туткин', '+79135002010', address('Москва', 'Пушкинская', 11, 53)).
person('Курткин', '+79601221212', address('Красноярск', 'Тютерева', 10, 10)).
car('Курткин', 'Toyota', 'Белый', 800000).
car('Пупкин', 'Toyota', 'Черный', 2600000).
car('Пупкин', 'BMW', 'Красный', 3900000).
car('Туткин', 'Nissan', 'Синий', 1600000).
depositor('Пупкин', 'Sber', '122', 5000000).
depositor('Курткин', 'Sber', '423', 583000).
depositor('Туткин', 'Sber', '6324', 20000).

/**>
а) По № телефона найти: Фамилию, Марку автомобиля, Стоимость автомобиля (может быть несколько);
find_car_info('+79991112233', SURNAME, CAR_KIND, PRICE)
*/
find_car_info(NUMBER, SURNAME, CAR_KIND, PRICE):-
    person(SURNAME, NUMBER, _),
	car(SURNAME, CAR_KIND, _, PRICE).

/**>
в) Используя сформированное в пункте а) правило, по № телефона найти: только Марку автомобиля (автомобилей может быть несколько);
*/
find_car_kind(NUMBER, CAR_KIND):-find_car_info(NUMBER, _, CAR_KIND, _).

/**>
с) Используя простой, не составной вопрос: по Фамилии (уникальна в городе, но в разных городах есть однофамильцы) и Городу проживания найти:  Улицу проживания, Банки, в которых есть вклады и №телефона.

find_person_info('Пупкин', 'Бердск', STREET, BANK, NUMBER)
*/
find_person_info(SURNAME, CITY, STREET, BANK, NUMBER):-person(SURNAME, NUMBER, address(CITY, STREET, _, _)),depositor(SURNAME, BANK, _, _).