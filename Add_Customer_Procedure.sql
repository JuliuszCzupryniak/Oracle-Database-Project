create or replace PROCEDURE DODAJ_KLIENTA 
(
  V_IMIE IN VARCHAR2 
, V_NAZWISKO IN VARCHAR2 
, V_KOD_ULICY IN VARCHAR2 
, V_KOD_POCZTOWY IN VARCHAR2 
, V_NUMER_ZAMELDOWANIA IN NUMBER 
, V_TELEFON IN NUMBER 
, V_MAIL IN VARCHAR2 
) AS 
BEGIN
  INSERT INTO KLIENT
  (KOD_POCZTOWY, KOD_ULICY, IMIE, NAZWISKO, NUMER_ZAMELDOWANIA, TELEFON, MAIL)
  values (V_KOD_POCZTOWY, V_KOD_ULICY, V_IMIE, V_NAZWISKO, V_NUMER_ZAMELDOWANIA, V_TELEFON, V_MAIL);
  COMMIT;
END DODAJ_KLIENTA;
