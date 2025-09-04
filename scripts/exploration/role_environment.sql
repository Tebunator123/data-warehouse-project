SELECT  jde_user_id AS jde_role, 
         CASE WHEN us.an_role_descr IS NULL THEN jde_user_id
		 ELSE us.an_role_descr
		 END AS an_role_descr
      , library_list  AS evironment,
	    CASE WHEN library_list = 'JPD920' THEN 'E920 Production Environment Web Client'
		     WHEN library_list = 'JPY920' THEN 'E920 Prototype Environment Web Client'
			 WHEN library_list = 'JDV920' THEN 'E920 Development Environment Web Client'
			 WHEN library_list = 'PD920' THEN 'E920 Production Environment Fat Client'
			 WHEN library_list = 'DV920' THEN 'E920 Development Environment Fat Client'
			 WHEN library_list = 'PY920' THEN 'E920 Prototype Environment Fat Client'
			 WHEN library_list = 'JARC920' THEN 'E920 Archive Environment Web Client'
			 WHEN library_list = 'CRS' THEN 'CRS Environment'
			 WHEN library_list = 'SKYCOMRBY' THEN 'SkyCom RBY Environment'
			 WHEN library_list = 'SKYCOM' THEN 'SkyCom Environment'
			 ELSE 'none'
			 END AS environment_description	     
      , seq_num 
  FROM  bronze.jde_f0093 ll
    LEFT JOIN bronze.jde_f00926 us
  ON us.an_user_id = ll.jde_user_id
  ORDER BY jde_user_id
