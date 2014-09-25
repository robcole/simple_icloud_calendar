require 'spec_helper'

module SimpleIcloudCalendar
  describe Calendar do

    let(:calendar) { Calendar.new(create_valid_config) }

    describe "#initialize" do

      it "should generate icalendar events from the icalendar feed" do
        event_classes = calendar.events.map(&:class).uniq
        expect(event_classes).to eq [SimpleIcloudCalendar::Event]
      end

    end


  end
end
