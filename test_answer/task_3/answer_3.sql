-- 3. Viết SQL để output ra được kết quả như bên dưới , mỗi cell là số lượng ticket của từng category
CREATE TABLE category AS
SELECT
	DATE(case_created_at) AS Ngày
	, COALESCE(SUM(CASE WHEN case_category_1 = "Product" THEN 1 END), 0) AS "Product"
	, COALESCE(SUM(CASE WHEN case_category_1 = "Facility" THEN 1 END), 0) AS "Facility"
	, COALESCE(SUM(CASE WHEN case_category_1 = "Service" THEN 1 END), 0) AS "Service"
FROM cellphones.ticket
GROUP BY Ngày
ORDER BY Ngày;