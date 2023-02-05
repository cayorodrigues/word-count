# word-count

A simple word counter

# Installing ruby

On macOS or Linux using Homebrew

```sh
brew install rbenv ruby-build
```

On Ubuntu or Debian

```sh
sudo apt install rbenv
```

Install ruby

```sh
rbenv install 3.2.0
rbenv global 3.2.0
```

# Installing dependencies

Navigate to project folder and run
```sh
bundle install
```

# Running

Run the app

```sh
ruby app.rb
```

The app will run at http://localhost:4567

# Testing

To run the tests

```sh
rspec
```

If it says 'rspec' command not found

```sh
rbenv rehash
```
