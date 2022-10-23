-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 


-- finds backers count
SELECT cf_id, COUNT(backers_count) 
FROM campaign
WHERE (outcome = 'live')
GROUP BY cf_id
ORDER BY backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT * FROM backers;
SELECT * FROM campaign;
SELECT * FROM category;
SELECT * FROM contacts;
SELECT * FROM subcategory;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT * FROM campaign
WHERE outcome = 'live';

SELECT co.first_name,co.last_name,co.email, (c.goal - c.pledged ) AS Remaining_Amount
INTO email_contacts
FROM contacts AS co
LEFT JOIN campaign AS c
ON (co.contact_id = c.contact_id)
WHERE c.outcome = 'live'
ORDER By remaining_amount DESC;



-- Check the table
SELECT * FROM  email_contacts;

--Written to check tables
SELECT * FROM backers
SELECT * FROM campaign;
SELECT * FROM category;
SELECT * FROM contacts;
SELECT * FROM subcategory;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT b.email,b.first_name,b.last_name, c.cf_id,c.company_name,c.description,c.end_date, (c.goal - c.pledged ) AS "Left of Goal"
INTO email_contacts_remaining
FROM backers AS b
INNER JOIN campaign AS c
ON (b.cf_id = c.cf_id)
WHERE c.outcome = 'live'
ORDER By b.last_name, b.first_name;

-- Check the table
SELECT * FROM email_contacts_remaining;
