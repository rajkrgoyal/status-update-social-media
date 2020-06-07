# Getting updates from webscale social media

● Functionality
1. Taking updated from Twitter, Facebook, Instagram
2. Handelling errors from result of social media API
3. Handling delay with response from social media API


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes


### Installing

A step by step series of examples that tell you have to get a development env running

1. Clone / Download the code.
2. You may create gemset in .ruby-gemset if you want.
3. Code is tested in ruby version 2.6.5.
4. Open terminal and cd in root directory.
5. Install bundler and gems:

```
gem install bundler
bundle install
EDITOR="subl --wait" rails credentials:edit --environment development
rails dev:cache
bundle exec sidekiq
```

### Enable cache in development enviornment

```
rails dev:cache
```

### Execution

```
rails server
curl localhost:3000
```
