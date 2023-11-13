--2)
INSERT INTO artists ( name, ArtistId)
VALUES ("Nicky jam", "276");
INSERT INTO genres (name, GenreId)
VALUES ("reggaeton", "276");
INSERT INTO albums (Title,ArtistId,AlbumId)
VALUES ("Fénix", "276","348");

INSERT into tracks (TrackId, Name, AlbumId, GenreId, Milliseconds, MediaTypeId,  UnitPrice)
VALUES("3504", "Mi Maldición", "348", "9", "74893", "1", "0.33")

INSERT into tracks (TrackId, Name, AlbumId, GenreId, Milliseconds, MediaTypeId, UnitPrice)
VALUES("3505", "Despacio", "348", "9", "745893", "1",  "0.66")

INSERT into tracks (TrackId, Name, AlbumId, GenreId, Milliseconds, MediaTypeId,  UnitPrice)
VALUES("3506", "Tu Hombre", "348", "9", "195000", "1", "0.33")

INSERT into tracks (TrackId, Name, AlbumId, GenreId, Milliseconds, MediaTypeId, UnitPrice)
VALUES("3507", "Mi Fantasia", "348", "9", "205200", "1",  "0.66")

INSERT into tracks (TrackId, Name, AlbumId, GenreId, Milliseconds, MediaTypeId, UnitPrice)
VALUES("3508", "Me Enamoras", "348", "9", "148800", "1",  "0.66")

INSERT into tracks (TrackId, Name, AlbumId, GenreId, Milliseconds, MediaTypeId, UnitPrice)
VALUES("3509", "Estrella", "348", "9", "202800", "1",  "0.66")

--3)
UPDATE employees
SET Phone = Fax, Fax = Phone

--4)


--5)
UPDATE employees
SET ReportsTo = EmployeeId
WHERE ReportsTo IS NULL;

--6)
DELETE FROM customers
WHERE CustomerId NOT IN (
    SELECT DISTINCT c.CustomerId
    FROM customers c
    LEFT JOIN invoices i ON c.CustomerId = i.CustomerId
    WHERE i.CustomerId IS NOT NULL
);

--7)
INSERT INTO customers (FirstName, LastName, SupportRepId, Email)
SELECT FirstName, LastName, ReportsTo AS SupportRepId, '' AS Email
FROM employees
WHERE EmployeeId NOT IN (SELECT CustomerId FROM customers);

UPDATE customers
SET SupportRepId = (
    SELECT SupportRepId
    FROM employees e
    WHERE customers.SupportRepId = e.EmployeeId
);
SELECT * FROM customers;