SELECT com_num 
      , ad.descr_compressed 
      , business_unit 
	  , bu.descr
      , industry_class 
      , search_type
	  , ud.jde_user_id
	  , ud.jde_role
	  , ud.effective_date
	  , ud.expiration_date
  FROM bronze.jde_f0101 ad
  LEFT JOIN bronze.jde_f0092 ua
  ON ua.address_number = ad.com_num
  LEFT JOIN bronze.jde_f95921 ud
  ON ud.jde_user_id = ua.jde_user_id
  LEFT JOIN bronze.jde_f0006 bu
  ON ad.business_unit = bu.bu_unit
  WHERE search_type ='X' AND ud.jde_role IS NOT NULL
  




