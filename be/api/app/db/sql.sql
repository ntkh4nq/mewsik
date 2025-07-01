CREATE TABLE users (
    id INT PRIMARY KEY IDENTITY,
    email NVARCHAR(255) UNIQUE NOT NULL,
    passwrd NVARCHAR(255) NOT NULL,
    time_created DATETIME DEFAULT GETDATE(),
    role NVARCHAR(50) NOT NULL
);

CREATE TABLE songs (
    id INT PRIMARY KEY IDENTITY,
    title NVARCHAR(255) NOT NULL,
    artist VARCHAR(255) NOT NULL,
    genre VARCHAR(255) NOT NULL,
    file_url TEXT UNIQUE NOT NULL,
);

CREATE TABLE playlists (
    id INT PRIMARY KEY IDENTITY,
    p_name NVARCHAR(255) NOT NULL,
    user_id INT,
    time_created DATETIME DEFAULT NOW,
    CONSTRAINT FK_userid_playlist FOREIGN KEY(user_id) REFERENCES users(id)
    ON DELETE CASCADE
);

CREATE TABLE playlistsongs (
    id INT PRIMARY KEY,
    playlist_id INT,
    song_id INT,
    UNIQUE(playlist_id, song_id),
    CONSTRAINT FK_playlist_id FOREIGN KEY(playlist_id) REFERENCES playlists(id),
    CONSTRAINT FK_song_id FOREIGN KEY(song_id) REFERENCES songs(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);