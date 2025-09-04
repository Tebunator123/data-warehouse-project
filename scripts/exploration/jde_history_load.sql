/*
======================================================================
DLL Script: Create F9312 JDE Table
======================================================================
Script Purpose:
	This script creates tables in the 'bronze' schema, dropping existing tables
	if they already exists.
	Run this script to re-define the DDL structure of 'bronze' Table
======================================================================
*/

IF OBJECT_ID('bronze.jde_f9312','U') IS NOT NULL
	DROP TABLE bronze.jde_f9312;
	GO
	CREATE TABLE bronze.jde_f9312(
	  hst_owm_object_name NVARCHAR(50),
	  hst_mem_description NVARCHAR(60),
	  hst_user_id NVARCHAR(50),
	  hst_enviro_name NVARCHAR(50),
	  hst_path_code NVARCHAR(50),
	  hst_role NVARCHAR(50),
	  hst_object_type NVARCHAR(50),
	  hst_object_name NVARCHAR(50),
	  hst_form_name NVARCHAR(50),
	  hst_version NVARCHAR(50),
	  hst_date_time NVARCHAR(50),
	  hst_time_updated NVARCHAR(50),
	  hst_prod_cost NVARCHAR(50),
	  hst_prod_code_desc NVARCHAR(50),
	  hst_report_code NVARCHAR(50),
	  hst_report_code_desc NVARCHAR(50),
	  hst_usage_type NVARCHAR(50),
	  hst_usage_type_desc NVARCHAR(50),
	  hst_launch_from NVARCHAR(50),
	  hst_machine_key NVARCHAR(50)
	  );

IF OBJECT_ID('bronze.jde_f00926','U') IS NOT NULL
	DROP TABLE bronze.jde_f00926;
	GO
	CREATE TABLE bronze.jde_f00926(
	   an_user_id NVARCHAR(20),
	   an_role_descr NVARCHAR(60),
	   an_seq_num NVARCHAR(60)
	   );

IF OBJECT_ID('bronze.jde_f9860','U') IS NOT NULL
	DROP TABLE bronze.jde_f9860;
	GO
	CREATE TABLE bronze.jde_f9860(
	  ob_object_name NVARCHAR(10),
	  ob_obj_descr NVARCHAR(110)
	);
	GO

TRUNCATE TABLE bronze.jde_f9860
BULK INSERT bronze.jde_f9860
	FROM 'C:\sql\dwh_project\datasets\jde\jde_f9860.csv'
	WITH (
	   FIRSTROW = 2,
	   FIELDTERMINATOR = ',',
	   TABLOCK
	);
--JDE history information
TRUNCATE TABLE bronze.jde_f9312;
BULK INSERT  bronze.jde_f9312
	FROM 'C:\sql\dwh_project\datasets\jde\jde_f9312.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

--JDE history information
TRUNCATE TABLE bronze.jde_f00926;
BULK INSERT  bronze.jde_f00926
	FROM 'C:\sql\dwh_project\datasets\jde\jde_f00926.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

/*ALTER TABLE bronze.jde_f9312
DROP COLUMN hst_id
*/

IF OBJECT_ID('bronze.jde_f93122','U') IS NOT NULL
	DROP TABLE bronze.jde_f93122;
	GO
	CREATE TABLE bronze.jde_f93122(
	hsuser_id NVARCHAR(15),
	event_type NVARCHAR(3),
	event_status NVARCHAR(3),
	machine_key NVARCHAR(15),
	program_id NVARCHAR(15),
	work_std_id NVARCHAR(15),
	date_signed_in DATE,
	time_updated NVARCHAR(10),
	date_signed_off DATE,
	time_signed_off NVARCHAR(8)
);
TRUNCATE TABLE bronze.jde_f93122;
BULK INSERT bronze.jde_f93122
	FROM 'C:\sql\dwh_project\datasets\jde\jde_f93122b.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

IF OBJECT_ID('bronze.jde_f0101','U') IS NOT NULL
	DROP TABLE bronze.jde_f0101
	GO
	CREATE TABLE bronze.jde_f0101(
	  com_num NVARCHAR(8),
	  long_address NVARCHAR(20),
	  descr_compressed NVARCHAR(256),
	  business_unit NVARCHAR(256),
	  industry_class NVARCHAR(25),
	  search_type NVARCHAR(25)
);

TRUNCATE TABLE bronze.jde_f0101;
BULK INSERT bronze.jde_f0101
	FROM 'C:\sql\dwh_project\datasets\jde\book1.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

IF OBJECT_ID('bronze.jde_f0092','U') IS NOT NULL
	DROP TABLE bronze.jde_f0092
	GO
	CREATE TABLE bronze.jde_f0092(
	  jde_user_id NVARCHAR(15),
	  address_number NVARCHAR(15),
);
TRUNCATE TABLE bronze.jde_f0092;
BULK INSERT bronze.jde_f0092
	FROM 'C:\sql\dwh_project\datasets\jde\jde_f0092.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

IF OBJECT_ID('bronze.jde_f0093','U') IS NOT NULL
	DROP TABLE bronze.jde_f0093
	GO
	CREATE TABLE bronze.jde_f0093(
	  jde_user_id NVARCHAR(15),
	  library_list NVARCHAR(15),
	  seq_num INT
);

TRUNCATE TABLE bronze.jde_f0093;
BULK INSERT bronze.jde_f0093
	FROM 'C:\sql\dwh_project\datasets\jde\jde_f0093.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

IF OBJECT_ID('bronze.jde_f95921','U') IS NOT NULL
	DROP TABLE bronze.jde_f95921
	GO
	CREATE TABLE bronze.jde_f95921(
	  jde_user_id NVARCHAR(15),
	  jde_role NVARCHAR(15),
	  effective_date DATE,
	  expiration_date DATE
);

TRUNCATE TABLE bronze.jde_f95921;
BULK INSERT bronze.jde_f95921
	FROM 'C:\sql\dwh_project\datasets\jde\jde_f95921.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

IF OBJECT_ID('bronze.jde_f0006','U') IS NOT NULL
	DROP TABLE bronze.jde_f0006
	GO
	CREATE TABLE bronze.jde_f0006(
	  bu_unit NVARCHAR(15),
	  related_bu NVARCHAR(15),
	  bu_type NVARCHAR(4),
	  descr_compressed NVARCHAR(80),
	  com NVARCHAR(5),
	  address_number NVARCHAR(15),
	  descr NVARCHAR(80),
	  division NVARCHAR (3),
	  region NVARCHAR(3),
	  jdegroup NVARCHAR(3),
	  brn_ofc NVARCHAR(3),
	  dpt_typ NVARCHAR(3),
	  rsp_cod NVARCHAR(3),
	  cat_11 NVARCHAR(3),
	  cat_12 NVARCHAR(3),
	  cat_13 NVARCHAR(3),
	  cat_14 NVARCHAR(3),
	  cat_15 NVARCHAR(3),
	  cat_16 NVARCHAR(3),
	  cat_17 NVARCHAR(3),
);

TRUNCATE TABLE bronze.jde_f0006;
BULK INSERT bronze.jde_f0006
	FROM 'C:\sql\dwh_project\datasets\jde\jde_f0006.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
IF OBJECT_ID('bronze.jde_f43008','U') IS NOT NULL
	DROP TABLE bronze.jde_f43008
	GO
	CREATE TABLE bronze.jde_f43008(
	person_resp NVARCHAR(10),
	order_type NVARCHAR(3),
	approval_route NVARCHAR(15),
	approval_limit NVARCHAR(15),
	app_descr NVARCHAR(60),
	jde_at NVARCHAR(2)
);

TRUNCATE TABLE bronze.jde_f43008;
BULK INSERT bronze.jde_f43008
	FROM 'C:\sql\dwh_project\datasets\jde\jde_f43008.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);