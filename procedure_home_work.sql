select * from Nbu_bank 
select * from Anor_bank 


call my_Proc('nbu','anor',6,7,1000)







create or replace procedure my_Proc( 
     sender_bank varchar(30),
	 getter_bank varchar(30),
	 sender_id integer,
	 getter_id integer,
	 amount float8
)  
LANGUAGE plpgsql
AS $$
begin 
	case 
	when sender_bank similar to  '(N|n)bu%' 
	then  BEGIN
				IF (SELECT client_balance FROM Nbu_bank WHERE client_id = sender_id) > amount THEN
					update Nbu_bank 
					set client_balance = client_balance - amount 
					where client_id = sender_id;
				ELSE
					RAISE NOTICE 'amount > balance';
				end if;
				if(getter_bank similar to  '(N|n)bu%' ) 
				then update Nbu_bank 
					  set client_balance = client_balance+amount 
					  where client_id = getter_id;  
			    end if;
			    if(getter_bank similar to  '(A|a)nor%') 
				then  update Anor_bank 
					  set client_balance = client_balance+amount 
					  where client_id = getter_id; 	
				end if;
				end;
			
			
			
	when sender_bank similar to  '(A|a)nor%' 
	then  
			  BEGIN
				IF (SELECT client_balance FROM Anor_bank WHERE client_id = sender_id) > amount THEN
					update Anor_bank
					set client_balance = client_balance - amount 
					where client_id = sender_id;
				ELSE
					RAISE NOTICE 'amount > balance';
				END IF; 
				
				if(getter_bank similar to  '(N|n)bu%' ) 
				then update Nbu_bank 
					  set client_balance = client_balance+amount 
					  where client_id = getter_id;  
				end if;	  
			    if(getter_bank similar to  '(A|a)nor%') 
				then  update Anor_bank 
					  set client_balance = client_balance+amount 
					  where client_id = getter_id; 	
				end if;
				end;
	
		
				
	end case;

	
 commit;
end; 
$$;





