--
-- Teste
DECLARE
-- Teste Package CRONOMETRO
-- Autor: Wesley David Santos
-- Skype: wesleydavidsantos		
-- https://www.linkedin.com/in/wesleydavidsantos
--
	
	v_OBJ NUMBER;

BEGIN

    BEGIN
		
		-- Iniciar a sessão de temporização
		CRONOMETRO.INICIAR('MINHA_CHAMADA_1');


		CRONOMETRO.INICIAR('MINHA_CHAMADA_2');


		SELECT COUNT(*) INTO v_OBJ FROM ALL_OBJECTS;

		CRONOMETRO.PARAR('MINHA_CHAMADA_1');

		SELECT COUNT(*) INTO v_OBJ FROM ALL_OBJECTS;
		SELECT COUNT(*) INTO v_OBJ FROM ALL_OBJECTS;
		SELECT COUNT(*) INTO v_OBJ FROM ALL_OBJECTS;
		SELECT COUNT(*) INTO v_OBJ FROM ALL_OBJECTS;
		SELECT COUNT(*) INTO v_OBJ FROM ALL_OBJECTS;
		SELECT COUNT(*) INTO v_OBJ FROM ALL_OBJECTS;
		SELECT COUNT(*) INTO v_OBJ FROM ALL_OBJECTS;

		CRONOMETRO.PARAR('MINHA_CHAMADA_2');


		-- Exibir o tempo de execução
		DBMS_OUTPUT.put_line('Tempo de execução MINHA_CHAMADA_1: ' || CRONOMETRO.GET_TEMPO('MINHA_CHAMADA_1') || ' segundos.');

		DBMS_OUTPUT.put_line('Tempo de execução MINHA_CHAMADA_2: ' || CRONOMETRO.GET_TEMPO('MINHA_CHAMADA_2') || ' segundos.');
    
        
        CRONOMETRO.EXCLUIR('MINHA_CHAMADA_1');
        
        CRONOMETRO.EXCLUIR('MINHA_CHAMADA_2');
    
						
		DBMS_OUTPUT.PUT_LINE( '' );
		DBMS_OUTPUT.PUT_LINE( '##### SUCESSO #####' );
		DBMS_OUTPUT.PUT_LINE( '' );
        
    EXCEPTION
        
        WHEN OTHERS THEN
            
            DBMS_OUTPUT.PUT_LINE( 'RESULTADO: ' || CRONOMETRO.GET_MSG_ERROR );		
            
            DBMS_OUTPUT.PUT_LINE( '-' );
            
			DBMS_OUTPUT.PUT_LINE( 'ERRO TESTE - SQLERRM: ' || SQLCODE || ' - ' || SQLERRM );		
			
			
			DBMS_OUTPUT.PUT_LINE( '##### FALHA #####' );			
			

    END;
    

	DBMS_OUTPUT.PUT_LINE( '>>>>>>>> FIM TESTE <<<<<<<<<' );
	DBMS_OUTPUT.PUT_LINE( '' );
	DBMS_OUTPUT.PUT_LINE( '' );


END;
/








