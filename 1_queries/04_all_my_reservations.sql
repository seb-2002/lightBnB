  select reservations.*, properties.*, avg(rating) as avg_rating 
  from reservations
  join properties on reservations.property_id = properties.id
  join property_reviews on reservations.id = property_reviews.reservation_id
  where reservations.guest_id = 1
  and end_date < now()::date
  group by properties.id, reservations.id
  order by start_date
  limit 10;

