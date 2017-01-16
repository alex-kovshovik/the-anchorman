[![Build Status](https://travis-ci.org/aspushkinus/take_dat_shit.svg?branch=master)](https://travis-ci.org/aspushkinus/take_dat_shit) [![Code Climate](https://codeclimate.com/github/aspushkinus/take_dat_shit/badges/gpa.svg)](https://codeclimate.com/github/aspushkinus/take_dat_shit) [![Test Coverage](https://codeclimate.com/github/aspushkinus/take_dat_shit/badges/coverage.svg)](https://codeclimate.com/github/aspushkinus/take_dat_shit/coverage)

# Take Dat Shit

This is a Rails application inspired by the long toilet wait times and uncertainty about taking a crap
on a certain floor in some building at some state on the continental United States.

As Brits often say:

> Everybody poops... but the queen.

## Installation instructions

1. Install Postgres
2. Install Ruby 2.2.2
3. Install bundler
4. Run "bundle"
5. Run "rake db:create"
6. Run "rake db:migrate"
7. Run "rake db:seed" to seed the database with the default group, user and a toilet.
6. Run "rails s"
7. Go take dat shit.

## Research queries

To calculate the length of all "transactions", run the following SQL:

```sql
select
  id, event,
  case when event = 'available' then to_char(created_at - lag(created_at) over (order by created_at), 'MI:SS') else '' end as shitting,
  case when event = 'occupied' then to_char(created_at - lag(created_at) over (order by created_at), 'HH24:MI:SS') else '' end as idling
from toilet_transactions
where toilet_id = 1
and created_at > '2015-08-20 14:00:00';
```

## License

[WTFPL](http://www.wtfpl.net/about/)
