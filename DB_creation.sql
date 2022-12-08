CREATE TABLE Content_info(
	content_id SERIAL PRIMARY KEY,
	description VARCHAR(200) NOT NULL
)

CREATE TABLE Scheduling_info(
	content_id INT,
	start_date date NOT NULL DEFAULT now(),
	end_date date NOT NULL,
	CONSTRAINT fk_Content FOREIGN KEY(content_id) references Content_info(content_id)
)


INSERT INTO Content_info(description) VALUES
('poker night'),
('snowfall'),
('car club meeting');

SELECT * FROM Content_info;
DELETE FROM Content_info WHERE content_id = 2;

INSERT INTO Scheduling_info(content_id, start_date, end_date) VALUES
(3, '1994-10-24', '1994-10-26'),
(1, '1994-10-27', '1994-10-28'),
(3, '1994-10-27', '1994-10-28');

SELECT * FROM Scheduling_info;

UPDATE Scheduling_info SET start_date=NOW(), end_date = NOW()+ INTERVAL '1 DAY' WHERE content_id = 1;

DELETE FROM Scheduling_info WHERE content_id is null;