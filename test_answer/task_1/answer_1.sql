-- 1. Viết SQL để lấy số ticket của 10 ngày gần nhất, lưu ý rằng có thể có những ngày không có ticket nào
WITH sub_ticket AS (
SELECT
	date(case_created_at) AS Ngày
FROM cellphones.ticket
)
SELECT
	Ngày
	, COUNT(Ngày) AS total_ticket
FROM sub_ticket
WHERE Ngày >= DATE_SUB((select MAX(Ngày) from sub_ticket), INTERVAL 10 DAY)
GROUP BY Ngày
ORDER BY Ngày;