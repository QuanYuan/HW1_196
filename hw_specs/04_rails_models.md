Make 2-3 scaffolds for your application using:

    rails generate MyModel field1:type field2:type ...

See http://guides.rubyonrails.org/migrations.html#supported-types for a list of supported types.

Migrate your database with:

    rake db:migrate

Map the root of your application to one of your scaffold index pages using:

    root :to => 'mymodels#index'

Make sure to remove the index.html file so you can see the listing when you access the root of the application.

Also make sure to migrate heroku's database after you deploy.

Submit the URL for both your github repository and your heroku application. Also include some information about your models and their intended purpose. Be sure to include all the scaffold index page links so the graders will know where to look.
