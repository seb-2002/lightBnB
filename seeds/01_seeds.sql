INSERT INTO users (name, email, password)
VALUES ('Eva Stanley', 'sebastianguerra@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Louisa Meyer', 'jacksonrose@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Dominic Parks', 'victoriablackwell@outlook.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Sue Luna', 'jasonvincent@gmx.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Rosalie Garza', 'jacksondavid@gmx.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Etta West', 'chalielevy@yahoo.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Margaret Wong', 'makaylaweiss@iscloud.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Leroy Hart', 'jaycereynolds@inbox.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');



INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code)
VALUES (1, 'Speed lamp', 'description', 'https://tse1.mm.bing.net/th?id=OIP.6F0Wjgo-M0n3RVjh_nNuZQHaFj&pid=Api', 'https://tse2.mm.bing.net/th?id=OIP.RjGQinvvru336AwLhnmGkgHaFj&pid=Api', 93061, 6, 4, 8, 'Canada', '546 Namsub Highway', 'Sotboske', 'Quebec', '28142'),
(1, 'Blank corner', 'description', 'https://tse4.mm.bing.net/th?id=OIP._FEBEX3CkWs74ndv4T-_vAHaEK&pid=Api', 'https://tse3.mm.bing.net/th?id=OIP.I5moFLfFjExbzxAim-DLgQHaEo&pid=Api', 85324, 0, 5, 6, 'Canada', '1650 Hejto Central', 'Genzuj', 'Newfoundland and Labrador', '44583'),
(2, 'Habitat Mix', 'description', 'https://tse2.mm.bing.net/th?id=OIP.3LYO7JHyso0ARurfAK4BSwHaF_&pid=Api', 'https://tse2.mm.bing.net/th?id=OIP.Wt2kVtEk0ptN-2djXb-ongHaGC&pid=Api', 46058, 6, 6, 7, 'Canada', '561 Nami Road', 'Bobhatiev', 'Alberta', '83680'),
(4, 'Headed know', 'description', 'https://tse4.mm.bing.net/th?id=OIP.GwKxabWQpBuggzXx2aODtQHaFj&pid=Api', 'https://tse1.mm.bing.net/th?id=OIP.fAXTo3OIolmBRw32CEQxlAHaEK&pid=Api', 82640, 0, 5, 5, 'Canada', '513 Powow Grove', 'Jaebvab', 'Ontario', '38051'),
(6, 'Port out', 'description', 'https://tse1.mm.bing.net/th?id=OIP.N_h1E0wuslwQxS-bH7N-pAHaE7&pid=Api', 'https://tse1.mm.bing.net/th?id=OIP.M3rxXgNJE8sqGxaYV8PmbQHaFj&pid=Api', 2358, 2, 8, 0, 'Canada', '1392 Gaza Junction', 'Ufptebav', 'Nova Scotia', '81059'),
(6, 'Fun glad', 'description', 'https://tse4.mm.bing.net/th?id=OIP.pkSmuw8h8LnxrCVD8tXjmAHaJ4&pid=Api', 'https://tse1.mm.bing.net/th?id=OIP.GIRl734RMAeeNyCdxPPLTQHaFB&pid=Api', 34291, 6, 6, 4, 'Canada', '169 Nuwug Circle', 'Vutgapha', 'Newfoundland and Labrador', '00159'),
(7, 'Shine twenty', 'description', 'https://tse3.mm.bing.net/th?id=OIP._pAi6puYrF-fT5dyXe5skQHaEK&pid=Api','https://tse3.mm.bing.net/th?id=OIP.LnrovKZMCc1abGGW_M3cNwHaE-&pid=Api', 13644, 1, 7, 8, 'Canada', '340 Dokto Park', 'Upfufa', 'Nova Scotia', '29045'),
(8, 'Game fill', 'description', 'https://tse1.mm.bing.net/th?id=OIP._Q_v9mIyIr5iOmbwV3Q6uwHaEK&pid=Api', 'https://tse2.mm.bing.net/th?id=OIP.IoI816NB6eh7j89dABdUiQHaE8&pid=Api', 23428, 5, 6, 4, 'Canada', '384 Buwmi Road', 'Rotunif', 'Newfoundland and Labrador', '58224');


INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2018-09-11', '2018-09-26', 2, 3),
('2019-01-04', '2019-02-01', 2, 2),
('2021-10-01', '2021-10-14', 1, 4),
('2014-10-21', '2014-10-21', 3, 5),
('2016-07-17', '2016-08-01', 3, 4),
('2018-05-01', '2018-05-27', 4, 8),
('2022-10-04', '2022-10-23', 5, 1),
('2015-09-03', '2015-09-30', 6, 8),
('2023-05-27', '2023-05-28', 4, 2),
('2023-04-23', '2023-05-02', 8, 1);

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES (2, 5, 10, 3, 'messages'),
(1, 4, 1, 4, 'messages'),
(8, 1, 2, 4, 'messages'),
(3, 8, 5, 4, 'messages'),
(4, 2, 7, 5, 'messages'),
(4, 3, 4, 4, 'messages'),
(5, 6, 3, 5, 'messages');



