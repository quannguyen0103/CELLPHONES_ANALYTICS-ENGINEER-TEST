WITH sub_ticket AS(
SELECT
	date(case_created_at) created_date
    , case_rating
	, case_category_1
FROM cellphones.ticket)

-- 1. Viết SQL để lấy số ticket của 10 ngày gần nhất, lưu ý rằng có thể có những ngày không có ticket nào
SELECT
	created_date
	, COUNT(created_date) AS total_ticket
FROM sub_ticket
WHERE created_date >= DATE_SUB((select MAX(created_date) from sub_ticket), INTERVAL 10 DAY)
GROUP BY created_date
ORDER BY created_date;

-- 2. Viết SQL để đếm số khách hàng có phản hồi 5 sao trong vòng 7 ngày vừa qua, tính từ ngày hôm nay
SELECT
	created_date
	, COUNT(created_date) AS total_ticket
FROM sub_ticket
WHERE created_date >= DATE_SUB((select MAX(created_date) from sub_ticket), INTERVAL 7 DAY)
AND case_rating = 5
GROUP BY created_date
ORDER BY created_date;

-- 3. Viết SQL để output ra được kết quả như bên dưới , mỗi cell là số lượng ticket của từng category
SELECT
	created_date
	, COALESCE(SUM(CASE WHEN case_category_1 = "Product" THEN 1 END), 0) AS "Product"
	, COALESCE(SUM(CASE WHEN case_category_1 = "Facility" THEN 1 END), 0) AS "Facility"
	, COALESCE(SUM(CASE WHEN case_category_1 = "Service" THEN 1 END), 0) AS "Service"
FROM sub_ticket
GROUP BY created_date
ORDER BY created_date;