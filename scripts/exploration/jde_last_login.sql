SELECT *
FROM (SELECT ROW_NUMBER() OVER (PARTITION BY hsuser_id ORDER BY date_signed_in DESC) as flag_last,
hsuser_id
      ,event_type,
		CASE WHEN  event_type = '1' THEN  'Sign-On'
		     WHEN  event_type = '2' THEN  'Sign-Off'
			 ELSE event_type
		END AS event_type_desc
      , event_status,
	  CASE WHEN event_status = '1' THEN 'Success'
	       WHEN event_status = '2' THEN 'Failure'
		   ELSE event_status
	  END AS event_status_descr
      , machine_key
      , program_id 
      , work_std_id 
      , date_signed_in 
      , time_updated 
      , CASE WHEN date_signed_off IS NULL THEN date_signed_in
	      ELSE date_signed_off
		  END AS date_signed_off
      , time_signed_off,
	    DATEDIFF(DAY, date_signed_off, GETDATE() ) AS num_of_days
  FROM  DataWarehouse2025 . bronze . jde_f93122 
  )t 
  LEFT JOIN bronze.jde_f0092 lu
  ON lu.jde_user_id = hsuser_id
  LEFT JOIN bronze.jde_f0101 ad
  ON ad.com_num = address_number
  WHERE flag_last = 1 AND num_of_days >= 20 AND lu.jde_user_id IS NOT NULL 
  ORDER BY date_signed_in DESC
