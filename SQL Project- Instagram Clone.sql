create database Insta_clone;
use insta_clone;


create table users
(
	id int auto_increment primary key,
    username varchar(100),
    created_at timestamp default now()
);

create table photos
(
	id int auto_increment primary key,
    image_url varchar(100),
    user_id int,
    created_at timestamp default now(),
    foreign key(user_id) references users(id)
);

create table comments
(
	id int auto_increment primary key,
    comment_text varchar(255),
    user_id int,
    photo_id int,
    created_at timestamp default now(),
    foreign key(photo_id) references photos(id),
    foreign key(user_id) references users(id)
);

create table likes
(
	user_id int,
    photo_id int,
    created_at timestamp default now(),
    foreign key(user_id) references users(id),
    foreign key(photo_id) references photos(id),
    primary key(user_id,photo_id)
);


create table follows
(
	follower_id int,
    followee_id int,
    created_at timestamp default now(),
    foreign key(follower_id) references users(id),
    foreign key(followee_id) references users(id),
    primary key(follower_id,followee_id)
);

create table tags
(
	id int auto_increment primary key,
    tag_name varchar(255),
    created_at timestamp default now()
);


create table photo_tags
(
	photo_id int not null,
    tag_id int not null,
    foreign key(photo_id) references photos(id),
    foreign key(tag_id) references tags(id),
    primary key(photo_id,tag_id)
);

insert into users(username,created_at) values ("Steve_smith","2011-06-21 09:45:00");
insert into users(username,created_at) values ("David_milly","2012-02-22 11:02:00");
insert into users(username,created_at) values("John_cena","2014-01-19 10:20:05");
insert into users(username,created_at) values("Michel_hussy","2017-05-20 12:12:59");
insert into users(username,created_at) values("kevin_peter","2011-08-11 12:01:01");
insert into users(username,created_at) values("John_abraham","2013-09-09 14:0user_id:00");
insert into users(username,created_at) values("Akshay_kumar","2019-01-05 13:00:00");
insert into users(username,created_at) values("Hrithik_roshan","2022-02-04 13:00:55");
insert into users(username,created_at) values("Sanjay_dutt","2024-06-07 14:01:05");
insert into users(username,created_at) values("Rajni_kant","2017-05-15 18:00:00");

insert into photos(image_url,user_id) values ("www.image1.com",1);
insert into photos(image_url,user_id) values ("www.image2.com",1);
insert into photos(image_url,user_id) values ("www.image3.com",1);
insert into photos(image_url,user_id) values ("www.image4.com",2);
insert into photos(image_url,user_id) values ("www.image5.com",2);
insert into photos(image_url,user_id) values ("www.image6.com",2);
insert into photos(image_url,user_id) values ("www.image7.com",3);
insert into photos(image_url,user_id) values ("www.image8.com",3);
insert into photos(image_url,user_id) values ("www.image9.com",3);
insert into photos(image_url,user_id) values ("www.image10.com",3);

select * from photos;

insert into follows(follower_id,followee_id) values (1,2);
insert into follows(follower_id,followee_id) values (1,3);
insert into follows(follower_id,followee_id) values (1,4);
insert into follows(follower_id,followee_id) values (2,1);
insert into follows(follower_id,followee_id) values (2,2);
insert into follows(follower_id,followee_id) values (2,3);
insert into follows(follower_id,followee_id) values (3,1);
insert into follows(follower_id,followee_id) values (3,2);
insert into follows(follower_id,followee_id) values (3,3);
insert into follows(follower_id,followee_id) values (3,4);

insert into comments(comment_text,user_id,photo_id) values ("Very_nice",1,2);
insert into comments(comment_text,user_id,photo_id) values ("Very_nice",1,4);
insert into comments(comment_text,user_id,photo_id) values ("Very_nice",2,5);
insert into comments(comment_text,user_id,photo_id) values ("Very_nice",3,6);
insert into comments(comment_text,user_id,photo_id) values ("Very_nice",4,5);
insert into comments(comment_text,user_id,photo_id) values ("Very_nice",6,8);
insert into comments(comment_text,user_id,photo_id) values ("Very_nice",7,7);
insert into comments(comment_text,user_id,photo_id) values ("Very_nice",8,9);
insert into comments(comment_text,user_id,photo_id) values ("Very_nice",9,10);

insert into likes(user_id,photo_id) values (1,2);
insert into likes(user_id,photo_id) values (1,1);
insert into likes(user_id,photo_id) values (3,2);
insert into likes(user_id,photo_id) values (2,2);
insert into likes(user_id,photo_id) values (3,2);
insert into likes(user_id,photo_id) values (4,2);
insert into likes(user_id,photo_id) values (6,2);
insert into likes(user_id,photo_id) values (8,2);
insert into likes(user_id,photo_id) values (4,1);
insert into likes(user_id,photo_id) values (7,2);

insert into tags(tag_name) values ("flower");
insert into tags(tag_name) values ("sunset");
insert into tags(tag_name) values ("sea");
insert into tags(tag_name) values ("rose");
insert into tags(tag_name) values ("beach");
insert into tags(tag_name) values ("enjoy");
insert into tags(tag_name) values ("journey");
insert into tags(tag_name) values ("buddies");
insert into tags(tag_name) values ("friends");
insert into tags(tag_name) values ("dosti");


insert into photo_tags(photo_id,tag_id) values (1,2);
insert into photo_tags(photo_id,tag_id) values (2,3);
insert into photo_tags(photo_id,tag_id) values (4,5);
insert into photo_tags(photo_id,tag_id) values (4,6);
insert into photo_tags(photo_id,tag_id) values (7,8);
insert into photo_tags(photo_id,tag_id) values (8,9);
insert into photo_tags(photo_id,tag_id) values (5,1);
insert into photo_tags(photo_id,tag_id) values (10,3);
insert into photo_tags(photo_id,tag_id) values (5,4);
insert into photo_tags(photo_id,tag_id) values (5,8);

/*We want to reward our users who have been around the longest find the 5 oldest users*/
	select username,created_at from users order by created_at limit 5 ;

/*what day of the week do most users register on ? we need to figure out when to schedule an ad campgain*/
select dayofweek(created_at)as DayofWeek_Created, count(username) as user_count from users
group by dayofweek(created_at);

/*we want to target our inactive users with an email campaign .find the users who have never posted a photo*/
select username as inactive_user from users left join photos
on users.id = photos.user_id
where user_id is null;

/*We are running a new contest to see who can get the most likes on a single photo.WHO WON???*/
SELECT p.id as photo_id, p.image_url, COUNT(*) AS likes_count
FROM photos p
INNER JOIN likes l ON p.id = l.photo_id
GROUP BY p.id, p.image_url
ORDER BY likes_count DESC
LIMIT 1;

/*Ours investors want to know ,how many times does the average user post? */
SELECT u.username, COUNT(p.id) AS num_posts
FROM users u
LEFT JOIN photos p ON u.id = p.user_id
GROUP BY u.id
ORDER BY num_posts DESC;

/*A brand wants to know which hashtags to use in a post what are the top 5 commonly used hashtags?*/
select tag_id, count(photo_id) as total_count, tag_name
from photo_tags join tags
on tags.id = photo_tags.tag_id
group by tag_id
order by total_count desc limit 5;


/*we have a small problem with bots on our site ...find users who have liked every single photo on the site?*/
SELECT DISTINCT user_id
FROM likes
GROUP BY user_id
HAVING COUNT(DISTINCT photo_id) = (SELECT COUNT(*) FROM photos);
/*Ans : not a single user to liked every photos*/

/*we also have a problem with celebrities .find the users who have never commented on a photo*/
SELECT *FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM comments);

/*are we overrun with bots and celebrity accounts ?
find the percentage of our user who have either never commented on a photo or have commented on every photo*/

-- Total Number of Users
SELECT COUNT(*) AS total_users FROM users;

-- Users Who Have Commented
SELECT COUNT(DISTINCT user_id) AS users_with_comments FROM comments;

-- Total Number of Distinct Photos
SELECT COUNT(*) AS total_photos FROM photos;

-- Users Who Have Commented on Every Photo
SELECT COUNT(*) AS users_commented_on_all_photos
FROM (
    SELECT user_id
    FROM comments
    GROUP BY user_id
    HAVING COUNT(DISTINCT photo_id) = (SELECT COUNT(*) FROM photos)
) AS users_all_comments;

-- Calculate Percentage
SELECT 
    (1 - (users_with_comments + users_commented_on_all_photos) / total_users) * 100 AS percentage_users
FROM (
    SELECT 
        (SELECT COUNT(*) FROM users) AS total_users,
        (SELECT COUNT(DISTINCT user_id) FROM comments) AS users_with_comments,
        (SELECT COUNT(*) FROM (
            SELECT user_id
            FROM comments
            GROUP BY user_id
            HAVING COUNT(DISTINCT photo_id) = (SELECT COUNT(*) FROM photos)
        ) AS users_all_comments) AS users_commented_on_all_photos
) AS counts;