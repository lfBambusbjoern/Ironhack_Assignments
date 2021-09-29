
use lab_db;

########### renaming column names 
ALTER TABLE data_marketing_customer_analysis_round2
CHANGE State state VARCHAR(30),
CHANGE `Customer Lifetime Value` customer_lifetime_value DOUBLE,
CHANGE Response response VARCHAR(30),
CHANGE Coverage coverage VARCHAR(30),
CHANGE Education education VARCHAR(45),
CHANGE `Effective To Date` effective_to_date VARCHAR(50),
CHANGE EmploymentStatus employment_status VARCHAR(30),
CHANGE Gender gender  VARCHAR(30),
CHANGE Income income INT,
CHANGE `Location Code` `location_code` VARCHAR(45),
CHANGE `Marital Status` marital_status VARCHAR(35),
CHANGE `Monthly Premium Auto` monthly_premium_auto INT,
CHANGE `Months Since Last Claim` months_since_last_claim VARCHAR(35),
CHANGE `Months Since Policy Inception` months_since_policy_inception INT,
CHANGE `Number Of Open Complaints` number_of_open_complaints VARCHAR(45),
CHANGE `Number of Policies` number_of_policies INT,
CHANGE `Policy Type` policy_type VARCHAR(35),
CHANGE Policy policy VARCHAR(35),
CHANGE renew_offer_type renewPolicy_offer_type VARCHAR(35),
CHANGE `Sales Channel` sales_channel VARCHAR(35),
CHANGE `Total Claim Amount` total_claim_amount DOUBLE,
CHANGE `Vehicle Class` vehicle_class VARCHAR(55),
CHANGE `Vehicle Size` vehicle_size VARCHAR(35),
CHANGE `Vehicle Type` vehicle_type VARCHAR(35);

############ dropping unused columns
ALTER TABLE data_marketing_customer_analysis_round2
DROP COLUMN Customer; 


####  dealing with  null values 
UPDATE data_marketing_customer_analysis_round2 SET number_of_open_complaints = 0
WHERE number_of_open_complaints NOT IN (1,2,3,4,5);

########################. removing duplicated rows 
### create temporary table for the duplicated raws
CREATE  temporary table duplicated_rows as 
(SELECT * FROM (SELECT *, ROW_NUMBER() OVER 
(PARTITION BY state,customer_lifetime_value,response,coverage,education,effective_to_date,employment_status,gender,
income,location_code,marital_status,monthly_premium_auto,months_since_last_claim,months_since_policy_inception,
number_of_open_complaints, number_of_policies, policy_type, policy,renew_offer_type,sales_channel,total_claim_amount,
vehicle_class,vehicle_size,vehicle_type
) AS raw_num FROM lab_db.data_marketing_customer_analysis_round2) t1 WHERE raw_num >1
);

## check if the table has the duplicated raws
select * from duplicated_rows;

### delete the duplicated rows from the customer analysis table
delete c from lab_db.data_marketing_customer_analysis_round2 AS c INNER JOIN duplicated_rows AS  d
on c.state=d.state and c.customer_lifetime_value=d.customer_lifetime_value and
c.response=d.response and c.coverage=d.coverage and c.education=d.education and
c.effective_to_date=d.effective_to_date and c.employment_status=d.employment_status and
c.gender=d.gender and c.income=d.income and c.location_code=d.location_code and c.marital_status=d.marital_status and
c.monthly_premium_auto=d.monthly_premium_auto and c.months_since_last_claim=d.months_since_last_claim and 
c.months_since_policy_inception=d.months_since_policy_inception and c.number_of_open_complaints=d.number_of_open_complaints and
c.number_of_policies = d.number_of_policies and c.policy_type= d.policy_type and c.`policy`=d.`policy` and c.`renew_offer_type`=d.`renew_offer_type`
and c.`sales_channel` =d.`sales_channel` and c.`total_claim_amount` =d.`total_claim_amount` and c.`vehicle_class`=d.`vehicle_class` and c.`vehicle_size`=d.`vehicle_size`
and c.`vehicle_type`=d.`vehicle_type` and d.raw_num>1 ;

drop table duplicated_rows;