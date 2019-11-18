create database InstaSam;
use InstaSam;

create table users (
    id int auto_increment primary key not null,
    username varchar(256),
    password varchar(256),
    email varchar(256),
    first_name varchar(256),
    last_name varchar(256),
    timestamp timestamp not null default current_timestamp,
    active boolean not null default true
);

create table insta_posts (
    id int auto_increment primary key not null,
    user_id int,
    image_url varchar(512),
    message text,
    active boolean not null default true
);

create table post_likes (
    id int auto_increment primary key not null,
    user_id int,
    post_id int,
    timestamp timestamp not null default current_timestamp
);

create table reports (
    id int auto_increment primary key not null,
    user_id int,
    post_id int,
    reason text,
    acted_on boolean not null default true
);

create table comments (
    id int auto_increment primary key not null,
    user_id int,
    post_id int,
    message text,
    active boolean not null default true
);

create table comment_likes (
    id int auto_increment primary key not null,
    user_id int,
    comment_id int,
    timestamp timestamp not null default current_timestamp
);

create table followers (
    id int auto_increment primary key not null,
    follower_id int,
    following_id int,
    timestamp timestamp not null default current_timestamp
);





select insta_posts.id, insta_posts.message, comments.message
    from insta_posts
    inner join comments
    on insta_posts.id = comments.post_id
    and insta_posts.active = true;
