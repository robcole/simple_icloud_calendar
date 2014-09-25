require 'spec_helper'

module SimpleIcloudCalendar
  describe Event do

    # what we need for testing Event:
    # Icalendar::Calendar objects with
    #   weekly, monthly, daily, and custom alerts

    # TODO: Mock this -- we should be passing in a valid Icalendar
    # Object and not worrying about how we get it (only interested in exercising
    # the Event model)
    let(:calendar) { Calendar.new(create_valid_config) }
    let(:ical_event) { create_valid_config.parsed_ical.events.first }
    let(:weekly_event) { Event.new(ical_event) }

    describe "#initialize" do
      # TODO: Redo this test -- you should be testing the results of initialization,
      # not the class.
      it "should convert an icalendar event" do
        expect(weekly_event.class).to eq Event
      end
    end

    describe "#convert_rules" do

      it "should convert weekly events into an ice_cube schedule event", :skip => true do
        expect(weekly_event.schedule.class).to eq Icecube::Schedule
      end
    end

  end
end
