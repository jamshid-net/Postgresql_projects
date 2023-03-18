select * from movie_cast 


select * from actor  
DROP FUNCTION get_top_movies
create or replace function get_top_movies(count integer)
returns table (mov_title VARCHAR, avg_rating numeric) as $$
begin
  return query select m.mov_title, avg(r.rev_stars) AS avg_rating
               FROM rating r
               natural join movie m 
               GROUP BY m.mov_title
               ORDER BY avg_rating DESC
               LIMIT count;
END;
$$ LANGUAGE plpgsql;

select * from get_top_movies(3)

select * from movie 
order by mov_date desc







select * from rating_log

select * from rating
 select * from movie_total_rating 
  
SELECT mov_id, AVG(rev_stars) AS avg_rating
FROM rating
GROUP BY mov_id
ORDER BY avg_rating DESC
LIMIT 3;


 
  