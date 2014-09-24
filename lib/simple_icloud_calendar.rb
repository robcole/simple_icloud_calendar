require 'icalendar'
require 'open-uri'
require 'ice_cube'
require 'active_support/time'
require_relative 'simple_icloud_calendar/version'
require_relative 'simple_icloud_calendar/configuration'
require_relative 'simple_icloud_calendar/event'
require_relative 'simple_icloud_calendar/calendar'


begin
  require "pry"
rescue LoadError
end

module SimpleIcloudCalendar
end
