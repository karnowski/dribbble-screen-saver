# To Setup

    gem install bundler
    bundle install
    ./fetch.rb --new

# To call daily, adding to the existing pile of shots

    ./fetch.rb

Note you must call "./fetch.rb --new" or else "mkdir shots" at least once before calling "./fetch.rb".

# To move your existing pile of shots to an archive directory and create a new directory

    ./fetch.rb --new
