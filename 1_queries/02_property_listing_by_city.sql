select properties.id as id, title, cost_per_night, avg(rating) as avg_rating
from properties
join property_reviews on properties.id = property_id
where city  like '%ancouve%'
group by properties.id
having avg(property_reviews.rating) >= 4
order by cost_per_night
limit 10;
