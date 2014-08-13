# Nuker
Nuker is a web-based Cucumber viewer and navigator.

## About
The first cut of a feature is collabatively written; but it then seems to become the property of developers, who commit it to a version control system.

The product owner or business analyst usually does not want to use an IDE or VCS client to view requiements. They also want to search or group features and scenarios.

## What's wrong with Relish?
Many of the ideas have been borrowed from Matt Wynne's Relish product, but we;

## Didn't want
* To sign-in

## Wanted to
* Use it through mobile devices
* Easily group features and scenarios by tags
* Count features and tags
* Include a project progress bar (based on tags)

## Installation
* Install [mongodb](http://www.mongodb.org/display/DOCS/Quickstart "mongodb") and ensure it is running  (e.g. '~ $ ./mongodb-xxxxx-xxxx-x.x.x/bin/mongod')
* ```gem install nuker```
* you might also want mongo_mapper (```gem install mongo_mapper```)

## Usage
* create a '.nuker' file and enter any authentication text you like (```echo myPassword > .wally```)
* run nuker server, in the same dir that you put the .wally file (```wally server```)
* check [http://localhost:4567/](http://localhost:4567/)
* import your features (from local dir) ```nuker push http://localhost:4567/projects/<project-name> <feature-dir>```

## Deleting projects
```nuker destroy http://localhost:4567/projects/<project-name>```


# Heroku
Add this to a config.ru:

```
require "nuker"
run Sinatra::Application
```

Add this to a Gemfile:

```
source :rubygems
gem "nuker"
```

Run ```bundle``` in that directory, commit this all to a git repo and push to Heroku!
