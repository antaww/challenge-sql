SELECT *,
CASE
    WHEN BillingCountry = 'France' THEN Total + 3
    WHEN BillingCountry = 'USA' THEN Total + 5
    ELSE Total + 1
END
FROM invoices;

