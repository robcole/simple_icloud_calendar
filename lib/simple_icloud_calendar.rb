require 'icalendar'
require 'open-uri'
require 'ice_cube'
require 'simple_icloud_calendar/version'
require 'simple_icloud_calendar/configuration'
#require 'simple_icloud_calendar/event'
#require 'simple_icloud_calendar/calendar'

begin
  require "pry"
rescue LoadError
end

module SimpleIcloudCalendar
  URL_BASE = 'https://p19-calendarws.icloud.com/ca/subscribe/1/G'
  CAL_ID = 'G2F6yAt4vAI0VzSKzT0wvEKb1bj2Gxfo8lS3SfEeGi5haGjwbPhE9D9uuHBBH69DtTBN8luR44qJC5pljF6iLCJnkLNC-D0n3XfbeBef_fk'

  attr_accessor :config

  def self.configure(&block)
  end
end

