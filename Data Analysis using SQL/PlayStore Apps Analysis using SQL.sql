#Task 1: Which are the top 10 apps having the highest rating in the given available dataset? (i.e cleaned_apps_db.csv dataset)

select App, Rating
from cleaned_apps_db
group by app 
order by rating desc
limit 10


#Task 2: What is the number of installs and reviews for the top 5 most reviewed apps?

select App, Installs, Reviews
from cleaned_apps_db
order by reviews desc
limit 5


#Task 3: Which app has the highest number of reviews? Also, mention the number of reviews and category of the app

select App, Category, Reviews
from cleaned_apps_db
order by Reviews desc
limit 1


#Task 4: Which Category of google play store apps has the highest number of installs? also, find out the total number of installs for that particular category.

select category, sum(installs) as total_installs
from cleaned_apps_db
group by category
order by total_installs desc
limit 1


#Task 5: Which Genre has the most number of published apps?

select genres, count(*) as PublishedApps
from cleaned_apps_db
group by Genres
order by PublishedApps desc
limit 1


#Task 6: Provide the list of all games ordered in such a way that the game that has the highest number of installs is displayed on the top

select distinct App, installs
from cleaned_apps_db
where category = 'GAME'
order by installs desc


#Task 7: How many apps from the given data set are free? Also, provide the number of paid apps.

(select Type, count(*)
from cleaned_apps_db
where Type = 'Free')
UNION
(select Type, count(*)
from cleaned_apps_db
where Type = 'Paid')


#Task 8: Which is the best dating app? (Best dating app is the one having the highest number of Reviews)

select app, reviews
from cleaned_apps_db
where Genres = 'Dating'
order by reviews desc
limit 1


#Task 10: Which comments of ASUS SuperNote have sentiment polarity and sentiment subjectivity both as 1?

select app, translated_review, sentiment_polarity, sentiment_subjectivity
from cleaned_reviews_db
where app = 'ASUS SuperNote' and sentiment_polarity = 1 and sentiment_subjectivity = 1


#Task 11: Get all the neutral sentiment reviews for the app Abs Training-Burn belly fat

select app, translated_review, sentiment
from cleaned_reviews_db
where app = 'Abs Training-Burn belly fat' and sentiment = 'Neutral'


#Task 12: Extract all negative sentiment reviews for ASUS Supernote with their sentiment polarity and sentiment subjectivity

select translated_review, sentiment_polarity, sentiment_subjectivity
from cleaned_reviews_db
where app = 'ASUS SuperNote' and sentiment = 'Negative'