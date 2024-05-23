create database webDB;

use webDB;

create table register_user(
id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(255) NOT NULL,
contactno VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
pass VARCHAR(255) NOT NULL
);

select * from register_user;
-- truncate register_user;

CREATE TABLE expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10, 2),
    category VARCHAR(255),
    mode_of_expense VARCHAR(255),
    date DATE,
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES register_user(id)
);

select * from expenses;
delete from expenses where expense_id=21;
truncate expenses;
desc expenses;
-- SELECT SUM(amount) as total_expense, MONTH(date) as month
--             FROM expenses
--             WHERE user_id = '$userId'
--             AND MONTH(date) IN ('$currentMonth', '$lastMonth')
--             GROUP BY MONTH(date)
--             ORDER BY MONTH(date) DESC;
            

-- SELECT SUM(amount) AS total_amount FROM expenses WHERE user_id = 1 AND DATE >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH);

-- SELECT DISTINCT DATE_FORMAT(date, '%Y-%m') AS month_year, date FROM expenses WHERE user_id = 1 ORDER BY date DESC LIMIT 2;


SELECT DISTINCT month_year FROM (SELECT DATE_FORMAT(date, '%Y-%m') AS month_year FROM expenses WHERE user_id = 1 ORDER BY date DESC) AS subquery LIMIT 2;
