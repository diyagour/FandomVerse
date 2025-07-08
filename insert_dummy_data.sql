
INSERT INTO characters (name, `show`, role) VALUES
('Arya Stark', 'Throne of Shadows', 'main'),
('Jon Snow', 'Throne of Shadows', 'main'),
('Daenerys Storm', 'Throne of Shadows', 'main'),
('Tyrion Lannister', 'Throne of Shadows', 'supporting'),
('Eleven', 'Mind Breakers', 'main'),
('Mike Wheeler', 'Mind Breakers', 'main'),
('Dustin Henderson', 'Mind Breakers', 'supporting');

INSERT INTO episodes (title, season, air_date) VALUES
('The Long Night', 1, '2021-01-15'),
('Winter’s Bite', 1, '2021-01-22'),
('Mind Games', 1, '2021-01-29'),
('Flames and Shadows', 2, '2022-03-05'),
('Upside Dawn', 2, '2022-03-12');

INSERT INTO character_episodes (character_id, episode_id, screen_time) VALUES
(1, 1, 25),
(2, 1, 40),
(3, 1, 15),
(4, 1, 10),
(5, 3, 35),
(6, 3, 20),
(7, 3, 15),
(1, 2, 30),
(2, 2, 45),
(3, 2, 25),
(4, 2, 15),
(5, 5, 30),
(6, 5, 20);

INSERT INTO interactions (character1_id, character2_id, episode_id, interaction_type) VALUES
(1, 2, 1, 'dialogue'),
(2, 3, 1, 'alliance'),
(3, 4, 1, 'betrayal'),
(5, 6, 3, 'dialogue'),
(6, 7, 3, 'alliance'),
(2, 4, 2, 'fight'),
(1, 3, 2, 'dialogue'),
(5, 7, 5, 'dialogue');

INSERT INTO fan_votes (character_id, episode_id, vote_count) VALUES
(1, 1, 350),
(2, 1, 420),
(3, 1, 290),
(5, 3, 500),
(6, 3, 310),
(7, 3, 120),
(2, 2, 500),
(3, 2, 150),
(5, 5, 400);
