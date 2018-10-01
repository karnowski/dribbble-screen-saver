-------------------------------------------------- 

## UPDATE 2018-10-01

Note that the Dribbble API has been altered and no longer supports the ability to download popular shots.  This effectively kills this screenshot project unless Dribbble makes new allowances in the future.

https://developer.dribbble.com/v2/shots/

-------------------------------------------------- 


## To Setup

    gem install bundler
    bundle install
    ./fetch.rb --new

## Usage

#### To call daily, adding to the existing pile of shots

    ./fetch.rb

Note you must call "./fetch.rb --new" or else "mkdir shots" at least once before calling "./fetch.rb".

#### To move your existing pile of shots to an archive directory and create a new directory

    ./fetch.rb --new
