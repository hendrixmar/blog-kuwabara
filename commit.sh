
git add .
git commit -am $1
#migrate db to heroku
heroku run rake db:migrate
#Commit to heroku
git push heroku master
