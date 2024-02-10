# Первое Домашнее задание
- [x] (2 балла) Продумать структуру базы данных и отрисовать в редакторе.
- [x] (2 балла) Нормализовать базу данных (1НФ — 3НФ), описав, к какой нормальной форме приводится таблица и почему таблица в этой нормальной форме изначально не находилась.
- [x] (3 балла) Создать все таблицы в DBeaver, указав первичные ключи к таблицам, правильные типы данных, могут ли поля быть пустыми или нет (использовать команду CREATE TABLE).
- [x] (3 балла) Загрузить данные в таблицы в соответствии с созданной структурой (использовать команду INSERT INTO или загрузить файлы, используя возможности инструмента DBeaver; в случае загрузки файлами приложить скрины, что данные действительно были залиты).

**Часть первая:** [Посмотреть скриншот можно тут:](pass)
<br>
<br>**Вторая часть:** Из двух таблиц, я сделал таблицу с наименованием **product**, **transaction**, **customer**, **postcode** и отдельный справочник **country**
<br> Рассмотрим эти таблицы':
- [x] из таблицы **transaction** я выделил отдельно продукт с составным ключом из столбцов **product_id** и **list_price**, так как эти два параметра дают уникальные параметры **brand, product_line, product_class, product_size** и **standart__cost**
- [x] Так же связал эту таблицу с таблицей **customer** по ключу **customer_id**
- [x] **customer_id** это не уникаальный ключ в таблице **transaction**, но этот факт, по моему мнению говорит только о том, что один человек мог приобрести несколько велосипедов как он-лайн, так и офф-лаин в магазине
- [x] В свою очередь таблица **customer** имеет графы **adress** и **postcode**, так как **adress** это практически уникальное значение, в отдельный справочник выводить не стал, а вот **postcode** он достаточно уникальный, чтобы выделить его в отдельную таблицу со справочником **country**

<br>Тем самым, я получил таблицы **transaction**,**product**,**customer**, **postcode**, **country** в 1НФ, 2НФ и 3НФ, так как не имеют повторяющихся групп (отношений), все атрибуты зависят только от первичного ключа, не имеют транзитивных связей
<br>
<br>**Третья и четвёртая часть:** [Посмотреть третью и четвёртую часть можно тут:](pass)
