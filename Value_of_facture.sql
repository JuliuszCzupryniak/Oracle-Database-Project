create or replace TRIGGER TR_WARTOSC_INS 
BEFORE INSERT ON POZYCJA_FAKTURY
FOR EACH ROW
DECLARE
V_NR number;
BEGIN
  V_NR:=:NEW.NR_FAKTURY;
  update naglowek_faktury
  set wartosc=nvl((select sum(naleznosc) from pozycja_faktury
            where nr_faktury=V_NR),0)
            where nr_faktury=V_NR;
END;
