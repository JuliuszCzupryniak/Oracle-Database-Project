select NR_KLIENTA as "Klient",IMIE||' '||NAZWISKO as "Imię i nazwisko",TELEFON as "Telefon",
MAIL as "E-Mail",MIASTO ||' '||k.KOD_POCZTOWY as "Miasto",ULICA ||' '|| NUMER_ZAMELDOWANIA as "Adres"
from klient k
join miasto m on k.kod_pocztowy=m.kod_pocztowy
join ulica u on k.kod_ulicy=u.kod_ulicy
order by 1
