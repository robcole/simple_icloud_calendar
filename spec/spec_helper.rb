require 'simple_icloud_calendar'
require 'webmock/rspec'
require_relative 'helpers/application_helper'

WebMock.disable_net_connect!(allow_localhost: true)
include ApplicationHelper
