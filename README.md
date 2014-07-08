## Rails/REST + Chaplin.js Application

This is a simple example single-page Javascript web application written with Chaplin.js. It uses Ruby on Rails as a RESTful JSON backend and Backbone and Chaplin.js for the front end. For familiarity and simplicity the user interface mimics the default Rails scaffold.

Most of the interesting bits are in [app/assets/javascripts](https://github.com/ptb/chaplin_rest/tree/master/app/assets/javascripts), but also be sure to check out the [view files](https://github.com/ptb/chaplin_rest/tree/master/app/views) and [routes.rb](https://github.com/ptb/chaplin_rest/blob/master/config/routes.rb).

### Major Technologies

- [Ruby on Rails](http://rubyonrails.org/)
- [CoffeeScript](http://coffeescript.org/)
- [RequireJS](http://requirejs.org/)
- [Backbone.js](http://backbonejs.org/)
- [Chaplin](http://chaplinjs.org/)
- [RABL](https://github.com/nesquena/rabl) JSON templates
- [React](http://facebook.github.io/react/) components
- [Haml Coffee](https://github.com/netzpirat/haml_coffee_assets) templates
- [Backbone.Stickit](http://nytimes.github.io/backbone.stickit/)

### Optional Components in Repository:

- [Slim](http://slim-lang.com/) HTML templates
- [Bootstrap](http://getbootstrap.com/) [Sass](http://sass-lang.com/)
- [Modernizr](http://modernizr.com/)
- [Devise](http://devise.plataformatec.com.br/) for authentication
- [Several](http://rspec.info/) [test](https://github.com/modeset/teaspoon) [frameworks](http://jnicklas.github.io/capybara/) [and](http://phantomjs.org/) [tools](http://docs.seleniumhq.org/)

### To Use
- [install RVM](https://github.com/ptb/middleman-slim-blog/blob/master/README.md)
- clone this project
- `cd` into the project directory
- run `bundle install`
- run `rake db:migrate`
- run `rails server`
- visit [localhost:3000/users](http://localhost:3000/users)

### Note

The [Rails Application Template](http://guides.rubyonrails.org/rails_application_templates.html) used to create the initial rails project is located in [doc/template.rb](https://github.com/ptb/chaplin_rest/blob/master/doc/template.rb). Several required configuration files were created as part of the initial project; read through the template for those details.
