-- 8-2-2-2

ALTER TABLE ator ADD CONSTRAINT Check_Sexo
	CHECK(sexo IN ('F', 'M'));


-- 8-2-2-3

CREATE OR REPLACE FUNCTION obter_idade(dtnasc date) 
	return number is

BEGIN
	return trunc(months_between(sysdate, dtnasc)/12);

END;
/
             

CREATE OR REPLACE TRIGGER inserir_idade
AFTER INSERT OR UPDATE ON ator
FOR EACH ROW

DECLARE

	idade int;

BEGIN

        idade := obter_idade(:new.dtnasc);

        INSERT INTO idadeAtor
       		(numID,
            	nomeart,
            	idade)
    	VALUES
       		(:new.numID,
             	:new.nomeart,
            	idade);

END;
/