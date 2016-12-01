[![Codacy Badge](https://api.codacy.com/project/badge/Grade/eef343c676f24c3eb03c6b4c413915f1)](https://www.codacy.com/app/DPN/dpn_swagger_engine?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=dpn-admin/dpn_swagger_engine&amp;utm_campaign=Badge_Grade)

# DPN SwaggerEngine

Include [swagger-ui](https://github.com/swagger-api/swagger-ui) as rails engine.

## Swagger specifications

https://github.com/swagger-api/swagger-spec/blob/master/versions/2.0.md

## Install

Add to Gemfile

```ruby
gem 'dpn_swagger_engine'
```

Add to your config/routes.rb

```ruby
mount DpnSwaggerEngine::Engine, at: "/api-docs"
```

### Protect your route

#### Devise

```ruby
authenticate :user do
  mount DpnSwaggerEngine::Engine, at: "/api-docs"
end
```

or

```ruby
authenticate :user, lambda { |u| u.admin? } do
  mount DpnSwaggerEngine::Engine, at: "/api-docs"
end
```

#### Basic HTTP Auth

Set username and password in `config/initializers/dpn_swagger_engine.rb`:

```ruby
DpnSwaggerEngine.configure do |config|
  config.admin_username = ENV['ADMIN_USERNAME']
  config.admin_password = ENV['ADMIN_PASSWORD']
end
```

## Configure

### JSON files

Set the path of your JSON files in a initializer:

```ruby
#config/initializers/dpn_swagger_engine.rb

DpnSwaggerEngine.configure do |config|
  config.json_files = {
    v1: "lib/swagger/swagger_v1.json",
    v2: "lib/swagger/swagger_v2.json"
  }
end
```
`lib/swagger/` is a good place to place them.  Unless otherwise configured,
as above, a default file is assumed to be available in
`lib/swagger/swagger.json`

### Edit your JSON files

Use [Swagger editor](https://github.com/swagger-api/swagger-editor).

## License

This project uses the MIT-LICENSE.

## Developed in collaboration with

Forked from https://github.com/batdevis/swagger_engine

### Swagger-UI Updates

```sh
# Download a swagger-ui release and set this to it's 'dist' path
SWAGGER='../swagger/swagger-ui-2.2.3/dist'

# update fonts
rm app/assets/fonts/dpn_swagger_engine/*.*
rsync -av ${SWAGGER}/fonts/ app/assets/fonts/dpn_swagger_engine/

# update images
rm app/assets/images/dpn_swagger_engine/*.*
rsync -av ${SWAGGER}/images/ app/assets/images/dpn_swagger_engine/

# update css
rm app/assets/stylesheets/dpn_swagger_engine/*.css
rsync -av ${SWAGGER}/css/ app/assets/stylesheets/dpn_swagger_engine/
# manual edits for the app/assets/stylesheets/dpn_swagger_engine/application.css
# see also includes in app/views/layouts/dpn_swagger_engine/application.html.erb
# see also includes in app/views/dpn_swagger_engine/swaggers/show.html.erb
# Also, manually modify any CSS files that contain image URLs to so that images
# can be found by the asset pipeline; move them to .css.erb files and change image URLs, e.g.
# background: url(<%= asset_data_uri 'dpn_swagger_engine/explorer_icons.png' %>) no-repeat;

# update javascripts
rm -rf app/assets/javascripts/dpn_swagger_engine/lib
rsync -av ${SWAGGER}/lib app/assets/javascripts/dpn_swagger_engine/
rm -rf app/assets/javascripts/dpn_swagger_engine/lang
rsync -av ${SWAGGER}/lang app/assets/javascripts/dpn_swagger_engine/
rsync -av ${SWAGGER}/swagger*.js app/assets/javascripts/dpn_swagger_engine/
rsync -av ${SWAGGER}/o2c.html app/assets/javascripts/dpn_swagger_engine/
rsync -av ${SWAGGER}/o2c.html app/views/dpn_swagger_engine/swaggers/
# manual edits for the app/assets/javascripts/dpn_swagger_engine/application.js

# update views
# manual edits for the app/views/dpn_swagger_engine/swaggers/show.html.erb
# using the code from ${SWAGGER}/index.html
```

## DPN Development

The swagger-ui has an `api-key` field that is used for the DPN authorization
token.  To accomplish this, there are some modifications to the
`app/views/dpn_swagger_engine/swaggers/show.html.erb`, which add some
javascript for managing the DPN authorization token.
