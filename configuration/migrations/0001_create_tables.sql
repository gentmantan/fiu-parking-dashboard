CREATE TABLE IF NOT EXISTS Garages (
  garage_id SERIAL PRIMARY KEY,
  garage_name TEXT NOT NULL,
  max_occupancy INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS ManualCounts (
  count_id SERIAL PRIMARY KEY,
  garage_id INTEGER NOT NULL references Garages(garage_id),
  count_real INTEGER NOT NULL CHECK (count_real >= 0),
  count_system INTEGER NOT NULL CHECK (count_system >= 0),
  timestamp TIMESTAMPTZ
);

SET timezone = 'America/New_York';

INSERT INTO Garages (garage_name, max_occupancy)
VALUES 
  ('PG1 Levels 1-2', 425),
  ('PG1 Levels 3 & up', 576),
  ('PG2 Levels 1-2', 345),
  ('PG2 Levels 3 & up', 616),
  ('PG3 Levels 1-2', 231),
  ('PG3 Levels 3 & up', 1202),
  ('PG4 Levels 1-2', 435),
  ('PG4 Levels 3 & up', 1045),
  ('PG5 Levels 1-2', 234),
  ('PG5 Levels 3 & up', 1611),
  ('PG6 Levels 1-2', 232),
  ('PG6 Levels 3 & up', 1747),
  ('Lot 1', 294),
  ('Lot 3', 205),
  ('Lot 4', 213),
  ('Lot 5', 505),
  ('Lot 7', 382),
  ('Lot 9', 584),
  ('Lot 10', 235),
  ('Lot 13', 77),
  ('Parkview', 293)
ON CONFLICT DO NOTHING;
