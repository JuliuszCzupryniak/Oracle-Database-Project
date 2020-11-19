create or replace PROCEDURE EDYTUJ_ILOSC 
(
  V_NR IN NUMBER 
, V_KOD_PRODUKTU IN NUMBER 
, V_ILOSC IN NUMBER 
) AS 
V_CENA number(20,2);
V_NALEZNOSC number(20,2);
V_STAN number;
BEGIN

  delete pozycja_faktury
  where KOD_PRODUKTU=V_KOD_PRODUKTU and NR_FAKTURY=V_NR;
  if V_ILOSC != 0 then
  
  select ilosc into v_stan from produkt 
  where kod_produktu=v_kod_produktu;
  v_stan:=v_stan-v_ilosc;
  if v_stan<0 then
  dbms_output.put_line('Nie mozna sprzedac tylu produktow');
  else
  select cena into v_cena from produkt
  where produkt.kod_produktu = V_Kod_produktu;
  V_NALEZNOSC:=V_CENA*V_ILOSC;
  INSERT INTO POZYCJA_FAKTURY
  values(V_NR , V_KOD_PRODUKTU, V_ILOSC, V_NALEZNOSC);
  update NAGLOWEK_FAKTURY
  set wartosc=wartosc+V_NALEZNOSC
  where nr_faktury=V_NR;
  COMMIT;
  end if;
  
  else 
  null;
  end if; 
  
  
END EDYTUJ_ILOSC;
