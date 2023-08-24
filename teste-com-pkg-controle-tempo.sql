--
-- Teste
--
DECLARE
-- Teste Package CONTROLE_TEMPO e CRONOMETRO
-- Autor: Wesley David Santos
-- Skype: wesleydavidsantos		
-- https://www.linkedin.com/in/wesleydavidsantos
--
--
-- Disponibilizei uma Package em outro repositório que realiza o Controle de Tempo
-- Essa Package permite realizar ações após xTempo dentro de um processo de loop (Cursor),
-- permitindo assim gerar logs sobre processos demorados, exemplo, ETL sem necessidade de criar scripts para gerar esse log.
--
-- Nesse teste, estou criando uma interação entre essas duas Packages.
--
-- GitHub: https://github.com/wesleydavidsantos/controle-de-tempo-PLSQL
-- 
	
	v_OBJ NUMBER;
    
    v_ID_CRONOMETRO_01 VARCHAR2(100);
	v_ID_CRONOMETRO_02 VARCHAR2(100);
	
	v_CONTADOR_LOOP_01 NUMBER DEFAULT 0;
	v_CONTADOR_LOOP_02 NUMBER DEFAULT 0;

BEGIN

    BEGIN
    
        CRONOMETRO.EXCLUIR('CRON_01');
        CRONOMETRO.EXCLUIR('CRON_02');
        
        v_ID_CRONOMETRO_01 := CONTROLE_TEMPO.SET_TEMPO_LIMITE(10);
	
        v_ID_CRONOMETRO_02 := CONTROLE_TEMPO.SET_TEMPO_LIMITE(5);
        
        CRONOMETRO.INICIAR('CRON_01');
        
        LOOP

            -- Iniciar a sessão de temporização    		
            IF CONTROLE_TEMPO.VERIFICAR_TEMPO( v_ID_CRONOMETRO_01 ) THEN
                
                DBMS_OUTPUT.PUT_LINE( 'PKG CONTROLE_TEMPO - Loop 01 - Execuções: ' || v_CONTADOR_LOOP_01 || ' / Horário: ' || SYSDATE  );
                DBMS_OUTPUT.PUT_LINE( '' );
                
                
                CRONOMETRO.PARAR('CRON_01');
                
                -- Exibir o tempo de execução
                DBMS_OUTPUT.put_line('PKG CRONOMETRO - Tempo de execução CRON_01: ' || CRONOMETRO.GET_TEMPO('CRON_01') || ' segundos.');
                
                
                CRONOMETRO.EXCLUIR('CRON_01');
                
                EXIT;
            
            END IF;
            
            
            v_CONTADOR_LOOP_01 := v_CONTADOR_LOOP_01 + 1;
            
            
            CRONOMETRO.INICIAR('CRON_02');
            
            LOOP
            
                IF CONTROLE_TEMPO.VERIFICAR_TEMPO( v_ID_CRONOMETRO_02 ) THEN
                
                    DBMS_OUTPUT.PUT_LINE( 'PKG CONTROLE_TEMPO - Loop 02 - Execuções: ' || v_CONTADOR_LOOP_02 || ' / Horário: ' || SYSDATE );
                    DBMS_OUTPUT.PUT_LINE( '' );
                    
                    
                    CRONOMETRO.PARAR('CRON_02');
                
                    -- Exibir o tempo de execução
                    DBMS_OUTPUT.put_line('PKG CRONOMETRO - Tempo de execução CRON_02: ' || CRONOMETRO.GET_TEMPO('CRON_02') || ' segundos.');
                    
                    
                    CRONOMETRO.EXCLUIR('CRON_02');
                    
                    EXIT;
                    
                END IF;
                
                v_CONTADOR_LOOP_02 := v_CONTADOR_LOOP_02 + 1;
                                    
            END LOOP;
            
            
        END LOOP;
        
						
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








