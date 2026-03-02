/* =========================================================
   FACEBOOK POST ANALYTICS QUERIES
   ========================================================= */


/* ---------------------------------------------------------
1. Total Reach by Country (Video/Reel posts containing 'o')
--------------------------------------------------------- */
SELECT
    country,
    SUM(reach) AS total_reach
FROM facebook_post_analytics
WHERE post_content LIKE '%o%'
  AND post_date BETWEEN '2024-01-01' AND '2024-02-15'
  AND post_type IN ('video','reel')
GROUP BY country
HAVING total_reach > 300000
ORDER BY total_reach DESC;


/* ---------------------------------------------------------
2. Average Likes for Gaming Content
--------------------------------------------------------- */
SELECT
    country,
    AVG(likes) AS avg_likes
FROM facebook_post_analytics
WHERE content_category = 'Gaming'
  AND post_content LIKE '%g%'
  AND post_date BETWEEN '2024-01-01' AND '2024-02-28'
GROUP BY country
HAVING avg_likes > 18000
ORDER BY avg_likes DESC;


/* ---------------------------------------------------------
3. Total Likes & Shares by Country and Category
--------------------------------------------------------- */
SELECT
    country,
    content_category,
    SUM(likes) AS total_likes,
    SUM(shares) AS total_shares
FROM facebook_post_analytics
WHERE post_type = 'Video'
  AND post_content LIKE '%e%'
  AND post_date BETWEEN '2024-01-01' AND '2024-02-28'
GROUP BY country, content_category
HAVING total_shares > 1500
ORDER BY total_likes DESC;


/* ---------------------------------------------------------
4. Finance Content Reach by Country & Language
--------------------------------------------------------- */
SELECT
    country,
    language,
    SUM(reach) AS total_reach
FROM facebook_post_analytics
WHERE content_category = 'Finance'
  AND user_name LIKE '%a%'
  AND post_date BETWEEN '2024-01-01' AND '2024-02-28'
GROUP BY country, language
HAVING total_reach > 250000
ORDER BY total_reach DESC;


/* ---------------------------------------------------------
5. Average Engagement Time (Fitness Content)
--------------------------------------------------------- */
SELECT
    country,
    AVG(engagement_time_minutes) AS avg_eng_time
FROM facebook_post_analytics
WHERE content_category = 'Fitness'
  AND reach BETWEEN 100000 AND 200000
  AND post_content LIKE '%work%'
GROUP BY country
HAVING avg_eng_time > 250000
ORDER BY avg_eng_time DESC;


/* ---------------------------------------------------------
6. Total Comments for Travel & Lifestyle Creators
--------------------------------------------------------- */
SELECT
    country,
    content_category,
    SUM(comments) AS total_comments
FROM facebook_post_analytics
WHERE content_category IN ('Travel','Lifestyle')
  AND post_date BETWEEN '2024-01-01' AND '2024-02-28'
  AND (user_name LIKE 'A%' OR user_name LIKE 'N%')
GROUP BY country, content_category
HAVING total_comments > 2000
ORDER BY total_comments DESC;


/* ---------------------------------------------------------
7. Reach by Language & Category (Selected Countries)
--------------------------------------------------------- */
SELECT
    language,
    content_category,
    SUM(reach) AS total_reach
FROM facebook_post_analytics
WHERE country IN ('India','USA','UK')
  AND post_date BETWEEN '2024-01-10' AND '2024-02-15'
  AND post_content LIKE '%A%'
GROUP BY language, content_category
HAVING total_reach > 300000
ORDER BY total_reach DESC;


/* ---------------------------------------------------------
8. Shares by Country and Post Type
--------------------------------------------------------- */
SELECT
    country,
    post_type,
    SUM(shares) AS total_shares
FROM facebook_post_analytics
WHERE post_content LIKE '%t%'
  AND post_date BETWEEN '2024-01-01' AND '2024-02-28'
  AND reach BETWEEN 80000 AND 250000
GROUP BY country, post_type
HAVING total_shares > 1200
ORDER BY total_shares DESC;


/* ---------------------------------------------------------
9. Reach by User and Category
--------------------------------------------------------- */
SELECT
    user_name,
    content_category,
    SUM(reach) AS total_reach
FROM facebook_post_analytics
WHERE post_content LIKE '%i%'
  AND post_date BETWEEN '2024-01-01' AND '2024-02-28'
  AND country IN ('India','USA')
GROUP BY user_name, content_category
HAVING total_reach > 300000
ORDER BY total_reach DESC;


/* ---------------------------------------------------------
10. Average Likes by Country (Lifestyle & Food)
--------------------------------------------------------- */
SELECT
    country,
    AVG(likes) AS avg_likes
FROM facebook_post_analytics
WHERE user_name LIKE '%e%'
  AND post_date BETWEEN '2024-01-01' AND '2024-02-28'
  AND content_category IN ('Lifestyle','Food')
GROUP BY country
HAVING avg_likes > 8000
ORDER BY avg_likes DESC;


/* ---------------------------------------------------------
11. Engagement Time by Country & Category
--------------------------------------------------------- */
SELECT
    country,
    content_category,
    SUM(engagement_time_minutes) AS total_eng_time
FROM facebook_post_analytics
WHERE post_content LIKE '%p%'
  AND post_date BETWEEN '2024-01-01' AND '2024-02-28'
  AND language = 'English'
GROUP BY country, content_category
HAVING total_eng_time > 600000
ORDER BY total_eng_time DESC;


/* ---------------------------------------------------------
12. Technology & Finance Reach (User Initial Filter)
--------------------------------------------------------- */
SELECT
    country,
    content_category,
    SUM(reach) AS total_reach
FROM facebook_post_analytics
WHERE (user_name LIKE 'M%' OR user_name LIKE 'R%')
  AND post_date BETWEEN '2024-01-01' AND '2024-02-28'
  AND content_category IN ('Technology','Finance')
GROUP BY country, content_category
HAVING total_reach > 250000
ORDER BY total_reach DESC;


/* ---------------------------------------------------------
13. Total Engagement for Video/Reel Posts
--------------------------------------------------------- */
SELECT
    country,
    SUM(engagement_time_minutes) AS total_eng
FROM facebook_post_analytics
WHERE post_content LIKE '%O%'
  AND post_date BETWEEN '2024-01-01' AND '2024-02-28'
  AND post_type IN ('Video','Reel')
GROUP BY country
HAVING total_eng > 800000
ORDER BY total_eng DESC;


/* ---------------------------------------------------------
14. Reach by Country & Category with Filters
--------------------------------------------------------- */
SELECT
    country,
    content_category,
    SUM(reach) AS total_reach
FROM facebook_post_analytics
WHERE post_type IN ('Video','Reel')
  AND user_name LIKE '%A%'
  AND post_date BETWEEN '2024-01-01' AND '2024-02-28'
  AND reach BETWEEN 100000 AND 250000
GROUP BY country, content_category
HAVING total_reach > 300000
ORDER BY total_reach DESC;