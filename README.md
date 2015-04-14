# Gem Store

by Tyler Pottle

## Description

This app in an example of deploying an Angularjs app on top of a Rails
backend.

The Angularjs was built first following the codeschool course
[Shaping Up with Angular.js](https://www.codeschool.com/courses/shaping-up-with-angular-js).
Then, I followed these steps to get the angular app to be rendered properly
through the rails asset pipeline.

1. create a new rails app ('rails new ...')
2. include angular and any other dependencies (I used [bower](bower.io) for this)
3. load in the files for your angular app (checkout the app/assets/javascripts subdirectory to see where I added these files).  Your main angular app javascript file should be in the javascripts file along with the rails application.js, but other js files should be in the angular app folder, inside app/assets/javascripts.
4. Make sure you are requiring the right files in both your application.js file and your angular app's main js file.  (//= require ...)
5. Make sure your view have the right angular markup.  Either your angular index.html or the index.html in your root path should have the ng-app tag
6. Use the asset_path helper to load in the neccessary assets.  See the products.js.erb file to see how I included all of my templates properly.
7. Put images in public/images.

And voila!  A new app with an angular front-end and a rails back-end!


To see this app in action go [here.](tyler-gemstore.herokuapp.com)
