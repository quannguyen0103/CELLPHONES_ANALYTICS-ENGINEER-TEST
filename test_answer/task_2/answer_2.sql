-- 2. Viết SQL để đếm số khách hàng có phản hồi 5 sao trong vòng 7 ngày vừa qua, tính từ ngày hôm nay
WITH sub_ticket AS (
SELECT
	date(case_created_at) AS Ngày
    , case_rating
FROM cellphones.ticket
)
SELECT
	COUNT(Ngày) AS total_ticket
FROM sub_ticket
WHERE Ngày >= DATE_SUB(CURDATE(), INTERVAL 6 DAY)
AND case_rating = 5;
