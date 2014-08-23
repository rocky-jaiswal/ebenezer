#Ebenezer

##Rails + Angular + Grunt.js project

- Run as a regular project for Rails (backend only serves JSON)
- Additionally go to public/angular_app and run __grunt serve__ to get the frontend component up and running
- Do a __grunt build__ for the minified app, ready to be served via nginx from the rails public directory


###Staging env with docker
- If you are docker friendly, just run __./staging.sh__ to get a dockerized staging environment.
