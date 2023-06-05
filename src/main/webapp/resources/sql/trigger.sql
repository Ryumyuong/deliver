create or replace trigger ID_SEQUENCE_TRIGGER
BEFORE INSERT
ON board
REFERENCING old AS old
FOR EACH ROW
when board.num > old.num 
BEGIN
	SELECT num_seq INTO :NEW.num FROM dual;
END;