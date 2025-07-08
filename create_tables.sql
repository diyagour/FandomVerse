
CREATE TABLE characters (
    character_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    `show` VARCHAR(100),
    role ENUM('main', 'supporting', 'cameo')
);

CREATE TABLE episodes (
    episode_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    season INT NOT NULL,
    air_date DATE
);

CREATE TABLE character_episodes (
    char_ep_id INT AUTO_INCREMENT PRIMARY KEY,
    character_id INT,
    episode_id INT,
    screen_time INT CHECK (screen_time >= 0),
    FOREIGN KEY (character_id) REFERENCES characters(character_id),
    FOREIGN KEY (episode_id) REFERENCES episodes(episode_id)
);

CREATE TABLE interactions (
    interaction_id INT AUTO_INCREMENT PRIMARY KEY,
    character1_id INT,
    character2_id INT,
    episode_id INT,
    interaction_type ENUM('dialogue', 'fight', 'alliance', 'betrayal'),
    FOREIGN KEY (character1_id) REFERENCES characters(character_id),
    FOREIGN KEY (character2_id) REFERENCES characters(character_id),
    FOREIGN KEY (episode_id) REFERENCES episodes(episode_id)
);

CREATE TABLE fan_votes (
    vote_id INT AUTO_INCREMENT PRIMARY KEY,
    character_id INT,
    episode_id INT,
    vote_count INT CHECK (vote_count >= 0),
    FOREIGN KEY (character_id) REFERENCES characters(character_id),
    FOREIGN KEY (episode_id) REFERENCES episodes(episode_id)
);
