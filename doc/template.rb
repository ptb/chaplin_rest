# rvm use --create ruby-2.1.1@#{app_name}
# gem install rails
# rails new app -J -T -m ~/Dropbox/template.rb

run 'gem update'

create_file '.ruby-version' do <<-RUBY_VERSION
2.1.1
RUBY_VERSION
end

create_file '.ruby-gemset' do <<-RUBY_GEMSET
#{app_name}
RUBY_GEMSET
end

create_file '.rvmrc' do <<-RVMRC
rvm use --create ruby-2.1.1@#{app_name}
bundle install
RVMRC
end
 
prepend_file 'Gemfile' do <<-GEMFILE
ruby '2.1.1'

GEMFILE
end

# if 'Your Ruby version is 1.9.3, but your Gemfile specified 2.1.1': `gem install bundler`

gsub_file 'Gemfile', /gem 'jquery-rails'/, "# gem 'jquery-rails'"
gsub_file 'Gemfile', /gem 'turbolinks'/, "# gem 'turbolinks'"

gem 'devise', '>= 3.2.3'
gem 'obfuscate_id', github: 'namick/obfuscate_id'
gem 'requirejs-rails', github: 'ptb/requirejs-rails'
gem 'slim-rails', '>= 2.1.0'
gem 'bootstrap-sass', '>= 3.1.1.0'
gem 'haml_coffee_assets', '1.15.1'
gem 'rabl', '>= 0.9.3'
gem 'oj', '>= 2.5.5'
gem 'js-routes', '>= 0.9.7'
gem 'execjs', '>= 2.0.2'

gem_group :development do
  # gem 'rack-mini-profiler', '~> 0.1.26'

  gem 'guard-bundler', '>= 2.0.0'
  gem 'guard-livereload', '>= 2.1.1'
  gem 'guard-rspec', '>= 4.2.8'
  gem 'guard-rubocop', '>= 1.0.2'
  gem 'guard-teaspoon', '>= 0.0.4'

  gem 'terminal-notifier-guard', '>= 1.5.3'
  gem 'rb-fsevent', '>= 0.9.4', require: false

  gem 'magic_encoding', github: 'prodis/magic_encoding'
end

gem_group :development, :test do
  gem 'thin', '>= 1.6.2'
  gem 'rspec-rails', '>= 2.14.1'
  gem 'factory_girl_rails', '>= 4.4.1'
  gem 'capybara', '>= 2.2.1'
  gem 'launchy', '>= 2.4.2'
  gem 'selenium-webdriver', '>= 2.40.0'
  gem 'poltergeist', '>= 1.5.0'
  gem 'teaspoon', '>= 0.7.9'
end

gem_group :test do
  gem 'database_cleaner', '>= 1.2.0'
  gem 'shoulda-matchers', '>= 2.5.0'
  gem 'simplecov', '>= 0.8.2', require: false
  gem 'simplecov-vim', '>= 0.0.1'
end

gem_group :production do
  # gem 'mysql2', '~> 0.3.11'
end

run 'bundle update'

generate 'rspec:install'
run 'bundle binstubs rspec-core'

generate 'teaspoon:install --coffee'

run 'guard init bundler'
run 'guard init livereload'
run 'guard init rspec'
run 'guard init rubocop'
run 'guard init teaspoon'

append_file '.gitignore' do <<-GITIGNORE
/coverage*
.DS_Store
!.keep
GITIGNORE
end

append_file '.rspec', '--format documentation'

create_file '.rubocop.yml' do <<-RUBOCOP
AllCops:
  Includes:
    - Rakefile
    - config.ru
  Excludes:
    - bin/**
    - db/**
    - config/**
    - log/**
    - public/**
    - tmp/**
    - vendor/**

Documentation:
  Enabled: false
RUBOCOP
end

create_file '.simplecov' do <<-SIMPLECOV
require 'simplecov-vim/formatter'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::VimFormatter
]
SimpleCov.start 'rails'
SIMPLECOV
end

remove_file 'app/assets/images/rails.png'

run '/bin/mkdir -p app/assets/javascripts/_base/'

create_file 'app/assets/javascripts/_base/base_application.js.coffee' do <<-BASE_APP
define ['chaplin', 'jquery'], (Chaplin, jquery) ->
  'use strict'

  jquery(document).ajaxSend (event, jqXHR, options) ->
    token = jquery('meta[name="csrf-token"]').attr('content')
    jqXHR.setRequestHeader 'X-CSRF-Token', token

  class Application extends Chaplin.Application
BASE_APP
end

create_file 'app/assets/javascripts/_base/base_collection.js.coffee' do <<-BASE_COLLECTION
define ['chaplin'], (Chaplin) ->
  'use strict'

  class Collection extends Chaplin.Collection
BASE_COLLECTION
end

create_file 'app/assets/javascripts/_base/base_collection_view.js.coffee' do <<-BASE_COLLECTION_VIEW
define ['chaplin'], (Chaplin) ->
  'use strict'

  class CollectionView extends Chaplin.CollectionView

    getTemplateFunction: ->
      return @template
BASE_COLLECTION_VIEW
end

create_file 'app/assets/javascripts/_base/base_controller.js.coffee' do <<-BASE_CONTROLLER
define ['chaplin'], (Chaplin) ->
  'use strict'

  class Controller extends Chaplin.Controller
BASE_CONTROLLER
end

create_file 'app/assets/javascripts/_base/base_model.js.coffee' do <<-BASE_MODEL
define ['chaplin'], (Chaplin) ->
  'use strict'

  class Model extends Chaplin.Model
BASE_MODEL
end

create_file 'app/assets/javascripts/_base/base_view.js.coffee' do <<-BASE_VIEW
define ['chaplin', 'backbone.stickit'], (Chaplin) ->
  'use strict'

  class View extends Chaplin.View

    autoRender: true

    getTemplateFunction: ->
      return @template

    render: ->
      super
      @stickit()
BASE_VIEW
end

remove_file 'app/assets/javascripts/application.js'

create_file 'app/assets/javascripts/main.js.coffee' do <<-MAIN_JS
requirejs.config
  urlArgs: 'bust=' + (new Date()).getTime()

require ['_base/base_application', 'routes'], (Application, routes) ->
  'use strict'

  new Application
    controllerPath: ''
    pushState: false
    routes: routes
    title: ''
MAIN_JS
end

create_file 'app/assets/javascripts/routes.js.coffee' do <<-ROUTES_JS
define [''], ->
  'use strict'

  (match) ->
    # match '',
    #   action: 'list'
    #   controller: ''
    #   name: '@list'

    # match 'new',
    #   action: 'new'
    #   controller: ''
    #   name: '@new'

    # match ':id',
    #   action: 'show'
    #   controller: ''
    #   constraints:
    #     id: /^\d+$/
    #   name: '@show'

    # match ':id/edit',
    #   action: 'edit'
    #   controller: ''
    #   constraints:
    #     id: /^\d+$/
    #   name: '@edit'
ROUTES_JS
end

create_file 'config/requirejs.yml' do <<-RJS_YML
findNestedDependencies: true
modules:
  - name: 'main'
paths:
  'backbone': 'backbone-min'
  'chaplin': 'chaplin-min'
  'exoskeleton': 'exoskeleton-min'
  'jquery': 'jquery-2.1.0-min'
  'jquerysrc': 'jquery/src'
  'underscore': 'underscore-min'
preserveLicenseComments: false
shim:
  'bootstrap/affix':
    deps: ['jquery']
  'bootstrap/alert':
    deps: ['jquery']
  'bootstrap/button':
    deps: ['jquery']
  'bootstrap/carousel':
    deps: ['jquery']
  'bootstrap/collapse':
    deps: ['jquery', 'bootstrap/transition']
  'bootstrap/dropdown':
    deps: ['jquery']
  'bootstrap/modal':
    deps: ['jquery']
  'bootstrap/popover':
    deps: ['jquery', 'bootstrap/tooltip']
  'bootstrap/scrollspy':
    deps: ['jquery']
  'bootstrap/tab':
    deps: ['jquery']
  'bootstrap/tooltip':
    deps: ['jquery']
  'bootstrap/transition':
    deps: ['jquery']
  'js-routes':
    exports: 'Routes'
wrap: true
RJS_YML
end

remove_file 'app/assets/stylesheets/application.css'
create_file 'app/assets/stylesheets/application.css.sass' do <<-APP_SASS
// From Rails.root:
// cd $(bundle show bootstrap-sass)/vendor/assets/stylesheets/bootstrap/

// Core variables and mixins
@import bootstrap/variables
@import bootstrap/mixins

// Reset
@import bootstrap/normalize
@import bootstrap/print

// Core CSS
@import bootstrap/scaffolding
@import bootstrap/type
@import bootstrap/code
@import bootstrap/grid
@import bootstrap/tables
@import bootstrap/forms
@import bootstrap/buttons

// Components
@import bootstrap/component-animations
@import bootstrap/glyphicons
@import bootstrap/dropdowns
@import bootstrap/button-groups
@import bootstrap/input-groups
@import bootstrap/navs
@import bootstrap/navbar
@import bootstrap/breadcrumbs
@import bootstrap/pagination
@import bootstrap/pager
@import bootstrap/labels
@import bootstrap/badges
@import bootstrap/jumbotron
@import bootstrap/thumbnails
@import bootstrap/alerts
@import bootstrap/progress-bars
@import bootstrap/media
@import bootstrap/list-group
@import bootstrap/panels
@import bootstrap/wells
@import bootstrap/close

// Components w/ JavaScript
@import bootstrap/modals
@import bootstrap/tooltip
@import bootstrap/popovers
@import bootstrap/carousel

// Utility classes
@import bootstrap/utilities
@import bootstrap/responsive-utilities
APP_SASS
end

run '/bin/mkdir -p app/views/application/'
create_file 'app/views/application/index.html.slim' do <<-INDEX_HTML
- content_for :head do
  sass:
    body
      // display: block
INDEX_HTML
end

remove_file 'app/views/layouts/application.html.erb'
create_file 'app/views/layouts/application.html.slim' do <<-LAYOUT
doctype 5
html.no-js(lang='en' xml:lang='en' xmlns='http://www.w3.org/1999/xhtml')
  head
    meta(charset='UTF-8')
    title #{app_name.humanize}
    meta(content='initial-scale=1, width=device-width' name='viewport')
    // script(src='/assets/modernizr.js')
    // link(href='/assets/application.css' rel='stylesheet')
    = csrf_meta_tags
    - if content_for? :head
      == yield :head
  body
    = yield
    = requirejs_include_tag 'main'
    // script(src='/assets/main.js')
LAYOUT
end

application <<-CONFIG
config.generators do |g|
      g.assets false

      g.template_engine :slim

      g.test_framework :rspec, view_specs: false
      g.integration_tool :rspec
    end

    config.sass.preferred_syntax = :sass

    if defined? ::HamlCoffeeAssets
      config.hamlcoffee.placement = 'amd'
    end
CONFIG

append_file 'config/database.yml' do <<-DATABASE

# production:
#   adapter: mysql2
#   encoding: utf8
#   database: <%= ENV['RDS_DB_NAME'] %>
#   username: <%= ENV['RDS_USERNAME'] %>
#   password: <%= ENV['RDS_PASSWORD'] %>
#   host: <%= ENV['RDS_HOSTNAME'] %>
#   port: <%= ENV['RDS_PORT'] %>
DATABASE
end

environment 'Slim::Engine.set_default_options pretty: false', env: 'production'

initializer 'rabl.rb' do <<-INIT_RABL
require 'rabl'
Rabl.configure do |config|
  # Commented as these are defaults
  # config.cache_all_output = false
  # config.cache_sources = Rails.env != 'development' # Defaults to false
  # config.cache_engine = Rabl::CacheEngine.new # Defaults to Rails cache
  # config.perform_caching = false
  # config.escape_all_output = false
  # config.json_engine = nil # Class with #dump class method (defaults JSON)
  # config.msgpack_engine = nil # Defaults to ::MessagePack
  # config.bson_engine = nil # Defaults to ::BSON
  # config.plist_engine = nil # Defaults to ::Plist::Emit
  config.include_json_root = false
  # config.include_msgpack_root = true
  # config.include_bson_root = true
  # config.include_plist_root = true
  # config.include_xml_root  = false
  config.include_child_root = false
  # config.enable_json_callbacks = false
  # config.xml_options = { :dasherize  => true, :skip_types => false }
  # config.view_paths = []
  # config.raise_on_missing_attribute = true # Defaults to false
  # config.replace_nil_values_with_empty_strings = true # Defaults to false
  # config.replace_empty_string_values_with_nil = true # Defaults to false
  # config.exclude_nil_values = true # Defaults to false
end
INIT_RABL
end

initializer 'slim.rb' do <<-INIT_SLIM
Slim::Engine.set_default_options attr_quote: "'", :format => :xhtml, pretty: true, sort_attrs: true, shortcut: {'@' => {attr: 'role'}, '#' => {attr: 'id'}, '.' => {attr: 'class'}, '%' => {attr: 'itemprop'}, '&' => {tag: 'input', attr: 'type'}}
INIT_SLIM
end

inject_into_file 'config/initializers/teaspoon.rb',
  :after => 'config.suite do |suite|' do <<-TEASPOONRB

    # https://github.com/modeset/teaspoon/wiki/RequireJS-with-Teaspoon
    suite.use_require = true
TEASPOONRB
end
gsub_file 'config/initializers/teaspoon.rb',
  ", 'spec/javascripts/stylesheets'", ''
gsub_file 'config/initializers/teaspoon.rb', /"/, "'"
gsub_file 'config/initializers/teaspoon.rb', /^\n\n/, "\n"

route "root to: 'application#index'"

run '/bin/mkdir -p coverage/javascripts/'

run '/bin/mkdir -p db/migrate/'

run '/bin/rm -rf doc/'

gsub_file 'Guardfile', 'javascripts/(.+).js', 'javascripts/(.+)\.(js|coffee)'

remove_file 'public/index.html'

# Thoughtbot Blog: http://bit.ly/QrzOH8
run '/bin/mkdir -p spec/features/'
run '/bin/mkdir -p spec/support/features/'

run '/bin/mkdir -p spec/controllers/'
run '/bin/mkdir -p spec/factories/'
run '/bin/mkdir -p spec/helpers/'
run '/bin/mkdir -p spec/models/'
run '/bin/mkdir -p spec/requests/'
run '/bin/mkdir -p spec/routing/'

# http://rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Actions
# http://rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Finders
# http://rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Matchers

# feature == describe ..., :type => :feature
# background == before
# scenario == it
# given/given! == let/let!

create_file 'spec/features/example_spec.rb' do <<-EXAMPLE
# encoding: UTF-8
# require 'spec_helper'
#
# feature ExampleClassName do
# feature '' do
#   before do
#     # visit '/'
#     # click_link ''
#     # click_button ''
#     # click_on ''
#     # fill_in '', with: ''
#     # choose 'A Radio Button'
#     # check 'A Checkbox'
#     # uncheck 'A Checkbox'
#     # attach_file 'Image', '/path/image.jpg'
#     # select 'Option', from: 'Select Box'
#   end
#
#   [:rack, :phantomjs, :chrome, :firefox, :safari].each do |driver|
#     scenario "\#{driver}", driver: driver do
#       # within 'li#employee' do
#        #   fill_in '', with: ''
#       # end
#       # within_fieldset 'Legend Tag Text' {}
#       # within_table 'Caption Tag Text' {}
#     end
#   end
# end
EXAMPLE
end

gsub_file 'spec/javascripts/spec_helper.coffee',
  '#= require application', '#= require require'

prepend_file 'spec/spec_helper.rb' do <<-SPEC_HELPER
require 'simplecov'

SPEC_HELPER
end

inject_into_file 'spec/spec_helper.rb',
  :after => /require 'rspec\/autorun'/ do <<-SPEC_HELPER2


require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.register_driver :rack do |app|
  Capybara::RackTest::Driver.new(app)
end

# brew install phantomjs
Capybara.register_driver :phantomjs do |app|
  Capybara::Poltergeist::Driver.new(app, inspector: true)
end

# brew install chromedriver
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

# bit.ly/ZSkgEN   gist.github.com/5550960
Capybara.register_driver :safari do |app|
  Capybara::Selenium::Driver.new(app, browser: :safari)
end

Capybara.default_driver = :rack
Capybara.javascript_driver = :phantomjs
SPEC_HELPER2
end

gsub_file 'spec/spec_helper.rb',/^  config\.fixture_path.*$/, ''
gsub_file 'spec/spec_helper.rb',
  /use_transactional_fixtures = true/, 'use_transactional_fixtures = false'

inject_into_file 'spec/spec_helper.rb',
  :after => /use_transactional_fixtures = false/ do <<-SPEC_HELPER3


  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
SPEC_HELPER3
end

gsub_file 'spec/spec_helper.rb', /"/, "'"
gsub_file 'spec/spec_helper.rb', /^\n\n/, "\n"

gsub_file 'spec/teaspoon_env.rb', /"/, "'"
gsub_file 'spec/teaspoon_env.rb', /#config/, '# config'
gsub_file 'spec/teaspoon_env.rb',
  /# config\.server_port.*$/, 'config.server_port = 3002'
gsub_file 'spec/teaspoon_env.rb',
  /# config\.coverage\ .*$/, 'config.coverage = true'
gsub_file 'spec/teaspoon_env.rb',
  /# config\.coverage_reports.*$/, "config.coverage_reports = 'text,html'"

inside('vendor/assets/javascripts') do
  get 'https://raw.github.com/jashkenas/backbone/master/backbone.js',
    'backbone.js'
  get 'https://raw.github.com/jashkenas/backbone/master/backbone-min.js',
    'backbone-min.js'
  get 'https://raw.github.com/jashkenas/backbone/master/backbone-min.map',
    'backbone-min.map'
  get 'http://chaplinjs.org/downloads/chaplin.js',
    'chaplin.js'
  get 'http://chaplinjs.org/downloads/chaplin.min.js',
    'chaplin-min.js'
  get 'https://github.com/paulmillr/exoskeleton/releases/download/0.6.3/exoskeleton.js',
    'exoskeleton.js'
  get 'https://github.com/paulmillr/exoskeleton/releases/download/0.6.3/exoskeleton.min.js',
    'exoskeleton-min.js'
  # http://timmywillison.com/post/63379183971/more-modules-for-your-modules-amd-in-jquery
  git clone: 'https://github.com/jquery/jquery.git'
  get 'http://code.jquery.com/jquery-1.11.0.js',
    'jquery-1.11.0.js'
  get 'http://code.jquery.com/jquery-1.11.0.min.js',
    'jquery-1.11.0-min.js'
  get 'http://code.jquery.com/jquery-2.1.0.js',
    'jquery-2.1.0.js'
  get 'http://code.jquery.com/jquery-2.1.0.min.js',
    'jquery-2.1.0-min.js'
  get 'http://modernizr.com/downloads/modernizr-latest.js',
    'modernizr.js'
  get 'https://raw.github.com/NYTimes/backbone.stickit/master/backbone.stickit.js',
    'backbone.stickit.js'
  get 'https://raw.github.com/jashkenas/underscore/master/underscore.js',
    'underscore.js'
  get 'https://raw.github.com/jashkenas/underscore/master/underscore-min.js',
    'underscore-min.js'
  get 'https://raw.github.com/jashkenas/underscore/master/underscore-min.map',
    'underscore-min.map'
end

inside('vendor/assets/javascripts/jquery') do
  git checkout: '2.1.0'
end

run '/bin/rm -rf test/'
remove_file 'README.rdoc'

run '/bin/rm -rf vendor/plugins/'

run 'magic_encoding'

prepend_file 'config.ru' do <<-UTF
# encoding: UTF-8
UTF
end

prepend_file 'Rakefile' do <<-UTF
# encoding: UTF-8
UTF
end

rake 'db:create'

run '/usr/bin/find . -type d -empty -exec touch {}/.keep \;'

inside('doc') do
  run '/bin/cp ~/Dropbox/template.rb .'
end

git :init
git add: '.', commit: '-m "Initial commit"'
