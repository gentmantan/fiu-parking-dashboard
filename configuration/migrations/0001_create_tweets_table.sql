CREATE TABLE IF NOT EXISTS ManualCounts (
  count_id INTEGER PRIMARY KEY,
  garage_id INTEGER NOT NULL,
  count INTEGER NOT NULL CHECK (count >= 0),
  date TEXT NOT NULL,
  time TEXT NOT NULL,
  FOREIGN KEY(garage_id) REFERENCES Garages(garage_id)
);

CREATE TABLE IF NOT EXISTS Garages (
  garage_id INTEGER PRIMARY KEY,
  garage TEXT NOT NULL,
  max_occupancy INTEGER NOT NULL
);

INSERT INTO Garages (garage, max_occupancy)
VALUES 
  ('PG1', 1001),
  ('PG2', 961),
  ('PG3', 1433),
  ('PG4', 1442),
  ('PG5', 1845),
  ('PG6', 1979);
