drop table if exists users cascade;
drop table if exists properties cascade;
drop table if exists reservations cascade;
drop table if exists property_reviews cascade;


create table users (
  id serial primary key not null,
  name varchar(255) not null,
  email varchar(255) not null,
  password varchar(255) not null
);

create table properties (
  id serial primary key not null,
  owner_id integer not null references users(id) on delete cascade,
  title varchar(255),
  description text,
  thumbnail_photo_url varchar(255) not null,
  cover_photo_url varchar(255) not null,
  cost_per_night integer not null default 0,
  parking_spaces integer not null default 0,
  number_of_bathrooms integer not null default 0,
  number_of_bedrooms integer not null default 0,
  country varchar(255) not null,
  street varchar(255) not null,
  city varchar(255) not null,
  province varchar(255) not null,
  post_code varchar(255) not null,
  active boolean not null default true
);

create table reservations (
  id serial primary key not null,
  start_date date not null,
  end_date date not null,
  property_id integer not null references properties(id) on delete cascade,
  guest_id integer not null references users(id) on delete cascade
);

create table property_reviews (
  id serial primary key not null,
  guest_id integer not null references users(id) on delete cascade,
  property_id integer not null references properties(id) on delete cascade,
  reservation_id integer not null references reservations(id) on delete cascade,
  rating smallint not null default 0,
  message text
);