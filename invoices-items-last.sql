SELECT Name
FROM tracks
WHERE TrackId IN
(SELECT ii.TrackId
FROM invoice_items ii
     JOIN invoices i ON ii.InvoiceId = i.InvoiceId
WHERE i.InvoiceId = (SELECT MAX(InvoiceId) FROM invoices));
