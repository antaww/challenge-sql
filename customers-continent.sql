SELECT FirstName, LastName, Country,
CASE
    WHEN Country IN ('Argentina', 'Brazil', 'Canada', 'Chile', 'USA') THEN 'America'
    WHEN Country IN ('Australia') THEN 'Oceania'
    WHEN Country IN ('Austria', 'Belgium', 'Czech Republic', 'Denmark', 'Finland', 'France',
    'Germany', 'Hungary', 'Ireland', 'Italy', 'Netherlands', 'Norway', 'Poland', 'Portugal',
    'Spain', 'Sweden', 'United Kingdom') THEN 'Europe'
    WHEN Country IN ('India') THEN 'Asia'
END AS 'Continent'
FROM customers;