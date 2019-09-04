####**Application setup**
```
- bundle
- rake db:create db:migrate
- rails s
```
####**Importing users**
```
- rake users:import #from users.csv file located in lib/assets
```

####**Cron jobs**
```
- whenever -i #Running cron job (background deleting transactions older than an hour).
```
####**API**
```
- *http://localhost:3000/apipie/1.0/users/transaction.html*
```
