# E16Theme

E16Theme is a project aiming at parsing any Enlightenment DR16 themes and converting them for kwin. The KDE window manager running the beautiful Plasma Desktop. Many DR16 themes are also beautiful and it would be great to be able to import them all at once very easily.

To develop the converter, I am using Ruby and ERB templates to generate QML files.
To make it easy for development, I have added a rails engine, so you can easily plug it into a Rails application.

## Demo

https://fifty-fifty.5gl.org/e16/theme/show?name=e13

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'e16_theme', github: 'mathieujobin/e16theme-ruby'
```

Add this line to your application's config/routes.rb:

```ruby
  mount E16Theme::RailsEngine => '/e16'
```

And then execute:

    $ bundle

## Usage

For now this is very early stage, and its not really usable. 
but you visit your favorite theme page, and you try to make it draw.
Then we need to properly develop the generated QML
once That is ready, users would copy paste it on their computer.

until we make a download tool. we could automatically generate a zip file that people can install straight from their system settings.


## Development

QML skills needed ! 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mathieujobin/e16_theme.
