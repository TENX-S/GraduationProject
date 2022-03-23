package model

const database = `
CREATE DATABASE IF NOT EXISTS
`

const userSchema = `
CREATE TABLE IF NOT EXISTS user (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(20) UNIQUE NOT NULL,
	pswdhash VARCHAR(64) NOT NULL
)
`

const postSchema = `
CREATE TABLE IF NOT EXISTS post (
	id BINARY(16) NOT NULL PRIMARY KEY,
	name VARCHAR(25) UNIQUE NOT NULL,
	dynasty VARCHAR(32) NOT NULL,
	descr VARCHAR(1024) NOT NULL,
	intro LONGTEXT NOT NULL,
	pic TEXT NOT NULL
)
`

const SignUpUser = `
INSERT INTO user (email, pswdhash)
VALUES (:email, :pswdhash)
`

const SignUpTestUser = `
REPLACE INTO user (email, pswdhash)
VALUES (:email, :pswdhash)
`

const QueryUser = `
SELECT pswdhash
FROM user
WHERE email=?
`

const QueryPost = `
SELECT *
FROM post
WHERE id=UUID_TO_BIN(?)
LIMIT 1
`

const AddPost = `
INSERT INTO post (id, name, descr, dynasty, intro, pic)
VALUES (UUID_TO_BIN(:id), :name, :descr, :dynasty, :intro, :pic)
ON DUPLICATE KEY UPDATE
id = UUID_TO_BIN(:id)
`

const FetchAllPosts = `
SELECT *
FROM post
`
