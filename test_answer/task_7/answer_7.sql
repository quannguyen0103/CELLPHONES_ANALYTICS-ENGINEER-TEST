-- 7. Viết SQL biểu diễn tổng số user có feedback trong 7 ngày và 28 ngày, biểu diễn theo từng ngày. Trong đó, từng ngày sẽ cần quét ngược về lịch sử 7 / 28 ngày.
WITH sub_ticket AS (
SELECT
	date(case_created_at) AS Ngày
    , user_id
FROM cellphones.ticket
)
SELECT
	Ngày
	, (
        SELECT COUNT(DISTINCT user_id)
        FROM sub_ticket s1
        WHERE s1.Ngày BETWEEN DATE_SUB(s1.Ngày, INTERVAL 6 DAY) AND s3.Ngày
    ) AS User_7_day
    , (
        SELECT COUNT(DISTINCT user_id)
        FROM sub_ticket s2
        WHERE s2.Ngày BETWEEN DATE_SUB(s2.Ngày, INTERVAL 27 DAY) AND s3.Ngày
    ) AS User_28_day
FROM sub_ticket s3
ORDER BY Ngày;