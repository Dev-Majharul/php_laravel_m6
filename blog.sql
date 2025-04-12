CREATE DATABASE blog;

USE blog;

-- Users Table
CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Posts Table
CREATE TABLE users_posts(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Comments Table
CREATE TABLE users_comments(
    id INT PRIMARY KEY AUTO_INCREMENT,
    comment TEXT NOT NULL,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES users_posts(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



-- Insert sample data into users
INSERT INTO users(email,password) VALUES ('samir@gmail.com', 'samir');

-- Insert sample data into posts
INSERT INTO users_posts(title, content, user_id) VALUES ('First Post', 'This is majharul first post.', 1);

-- Insert sample data into comments
INSERT INTO users_comments(comment, user_id, post_id) VALUES ('This is samir first test comment .', 1, 1);


-- Get all posts with user information
SELECT u.id AS UserID, u.email AS UserEmail,
       p.id AS PostID, p.title AS PostTitle, p.content As PostDiscription,
       c.id AS comment_id, c.comment AS comment
FROM users AS u
JOIN users_posts AS p ON u.id = p.user_id
JOIN users_comments AS c ON p.id = c.post_id
WHERE c.user_id = u.id;
