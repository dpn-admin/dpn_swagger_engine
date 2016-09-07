# DPN SwaggerEngine

Include [swagger-ui](https://github.com/swagger-api/swagger-ui) as rails engine.

## Swagger specifications

https://github.com/swagger-api/swagger-spec/blob/master/versions/2.0.md

## Install

Add to Gemfile

```gem 'dpn_swagger_engine'```

Add to your config/routes.rb

```mount SwaggerEngine::Engine, at: "/api-docs"```

### Protect your route

#### Devise

```
authenticate :user do
  mount SwaggerEngine::Engine, at: "/api-docs"
end
```

or

```
authenticate :user, lambda { |u| u.admin? } do
  mount SwaggerEngine::Engine, at: "/api-docs"
end
```

#### Basic HTTP Auth

Set username and password in `config/initializers/swagger_engine.rb`:

```
SwaggerEngine.configure do |config|
  config.admin_username = ENV['ADMIN_USERNAME']
  config.admin_password = ENV['ADMIN_PASSWORD']
end
```

## Configure

### JSON files

Set the path of your JSON files in a initializer:

```
#config/initializers/swagger_engine.rb

SwaggerEngine.configure do |config|
  config.json_files = {
    v1: "lib/swagger/swagger_v1.json",
    v2: "lib/swagger/swagger_v2.json"
  }
end
```
`lib/swagger/` is a good place to place them..

### Edit your JSON files

Use [Swagger editor](https://github.com/swagger-api/swagger-editor).

## License

This project uses the MIT-LICENSE.

## Developed in collaboration with

Forked from https://github.com/batdevis/swagger_engine
