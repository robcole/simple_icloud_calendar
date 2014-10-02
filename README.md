# SimpleIcloudCalendar

SimpleIcloudCalendar is a gem to read from public iCloud-hosted
Calendars.

---

# Dependencies

SimpleIcloudCalendar requires Ruby 2+, [iCalendar 2.0](https://github.com/icalendar/icalendar) for parsing ical-formatted files, [ice cube](https://github.com/seejohnrun/ice_cube) for generating scheduling/recurrence rules for recurring events, and [ActiveSupport's time extensions](http://edgeguides.rubyonrails.org/active_support_core_extensions.html).

---
# Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_icloud_calendar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_icloud_calendar

---

# Example Use

### With [FullCalendar](http://fullcalendar.io/) and Rails


```
# app/controllers/calendar_controller.rb
#
# start_date and end_date default to beginning and end of current month
# if not included in options

def index
	calendar = SimpleIcloudCalendar::Calendar.new(
		ical_url: 'https://icloud.com/example',
		start_date: Date.today.beginning_of_month,
		end_date: Date.today.end_of_month)
	respond_with(calendar.events_json)
end
```

calendar/index.html.erb
```
<script>
$(document).ready(function () {
    $('#calendar').fullCalendar({
      events: '/calendar.json'
      })
    });
</script>

<div id="calendar">
</div>
```

---
# Contributing

1. Fork it ( https://github.com/robcole/simple_icloud_calendar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
