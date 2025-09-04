SELECT
hs.hst_user_id,
hs.hst_role,
CASE WHEN ac.an_role_descr IS NULL THEN '*ALL'
	 ELSE
          ac.an_role_descr
END an_role_descr,
hst_object_name,
ob.ob_obj_descr,
COUNT(hst_object_name) AS num_of_times
FROM bronze.jde_f9312 hs
LEFT JOIN bronze.jde_f0092 lu
ON lu.jde_user_id =  hs.hst_user_id 
LEFT JOIN bronze.jde_f0101 ad
ON ad.com_num = lu.address_number
LEFT JOIN bronze.jde_f9860 ob
ON ob.ob_object_name = hs.hst_object_name
LEFT JOIN bronze.jde_f00926 ac
ON ac.an_user_id = hs.hst_role
WHERE ad.search_type != 'X' AND  hst_object_name NOT IN ('P986162', 'P98616','P95621')
GROUP BY hs.hst_user_id,
hs.hst_role,
ac.an_role_descr,
hst_object_name,
ob.ob_obj_descr
ORDER BY hs.hst_user_id

