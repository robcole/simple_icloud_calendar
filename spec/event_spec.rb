require 'spec_helper'

module SimpleIcloudCalendar
  describe Event do

    # what we need for testing Event:
    # Icalendar::Calendar objects with
    #   weekly, monthly, daily, and custom alerts

    let(:nonrecurring_event) { Event.new(mocked_ical_event) }
    
    let(:weekly_event) do
      s = 'Weekly Recurring Event'
      dst = DateTime.now
      dend = DateTime.now + 1.hour
      mocked_ical_event(summary: s, dtstart: dst, dtend: dend)
    end

    describe "#initialize" do
      # TODO: Redo this test -- you should be testing the results of initialization,
      # not the class.
      it "should convert an icalendar event" do
        expect(nonrecurring_event.class).to eq Event
      end
    end

    describe "#summary" do
      it "should return the default summary" do
        expect(nonrecurring_event.summary).to eq 'A Stub of a Summary'
      end
    end

    describe "#recurring?" do
      it "should return true when it is an instance of a recurring event" do
        expect(recurring_event.recurring?).to be true
      end

      it "should return false when it is not an instance of a recurring event" do
        expect(nonrecurring_event.recurring?).to be false
      end
    end

  end
end
