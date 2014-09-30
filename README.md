# SimpleIcloudCalendar

SimpleIcloudCalendar is a gem to read from public iCloud-hosted
Calendars, in order to create locally hosted calendars.

## Dependencies

SimpleIcloudCalendar relies on [Oj](https://github.com/ohler55/oj) for JSON generation, [iCalendar 2.0](https://github.com/icalendar/icalendar) for parsing ical-formatted files, [ice cube](https://github.com/seejohnrun/ice_cube) for generating scheduling/recurrence rules for recurring events, and [ActiveSupport's time extensions](http://edgeguides.rubyonrails.org/active_support_core_extensions.html).

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

```
# Add a link to your public calendar
# Requires ical_url, other fields are optional

ical_url = 'https://ical.com/example' #link to your public calendar
start_date = Date.today.beginning_of_month
end_date = start_date.end_of_month

config = SimpleIcloudCalendar::Configuration.new(ical_url: ical_url, start_date: start_date, end_date: end_date)
```

### Find Events for the Current Month

```
cal = SimpleIcloudCalendar::Calendar.new(config: config)
cal.events # => 

```

## Contributing

1. Fork it ( https://github.com/robcole/simple_icloud_calendar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
