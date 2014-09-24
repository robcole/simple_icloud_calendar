# SimpleIcloudCalendar

SimpleIcloudCalendar is a gem to read from public iCloud-hosted
Calendars, in order to create locally hosted calendars.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_icloud_calendar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_icloud_calendar

## Usage

### Configuration

```calendar_url = 'https://icloud_public_url' # Add a link to your
public calendar
```

### Find Events for the Current Month

```SimpleIcloudCalendar::Calendar.find_events(calendar_url)
```

## Contributing

1. Fork it ( https://github.com/robcole/simple_icloud_calendar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
