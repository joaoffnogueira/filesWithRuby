# filesWithRuby - dealing with files on Ruby - Week 2

This project gives an introduction about dealing with files on Ruby!

To run it on a linux distro, begin installing rvm, the version manager of Ruby:

Install GPG keys:

`gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`

Install RVM:

`\curl -sSL https://get.rvm.io | bash -s stable`

Install Ruby:

`rvm install ruby 3.1.0`

Install Bundler to manage dependencies (rspec for test, for ex.):

`gem install bundler`

Clone this repository and, on its folder, get the gems:

`bundle install`

Now you can run `ruby main.rb` providing your own log file or use this one for test:

<https://gist.github.com/fabiosammy/ba973184e82e930043df8d4aa002bde4>

To test you can run:

```bash
rspec spec/parser_spec.rb
```
