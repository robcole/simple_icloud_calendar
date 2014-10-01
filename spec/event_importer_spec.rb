require 'spec_helper'

module SimpleIcloudCalendar
  describe EventImporter do

    let(:importer) do
      ical_events = load_calendar.parsed_icalendar.events
      EventImporter.new(config: load_calendar.config,
                        icalendar_events: ical_events)
    end

    let(:recurring_event) do
      load_calendar(file: 'weekly').parsed_icalendar.events.first
    end

    let(:nonrecurring_event) do
      importer.icalendar_events.first
    end

    describe "#date_range" do
      it "should have a valid start date and end date from the config" do
        config = load_calendar.config
        expect(importer.date_range).to eq ((config.start_date)..(config.end_date))
      end
    end

    context "Calendar with One Time and Recurring Events" do
      let(:mixed_importer) do
        cal = load_calendar(file: 'mixed')
        ical_events = cal.parsed_icalendar.events
        EventImporter.new(config: cal.config, icalendar_events: ical_events)
      end

      describe "#nonrecurring_events" do
        it "should find all nonrecurring events in a calendar" do
          nonrecurring_events = mixed_importer.nonrecurring_events
          expect(nonrecurring_events.count).to eq 2
        end
      end

      describe "#recurring_events" do
        it "should find all recurring events in a calendar" do
          recurring_events = mixed_importer.recurring_events
          expect(recurring_events.count).to eq 1
        end
      end
    end

    describe "#nonrecurring_event?" do
      it "should return false on events that are recurring" do
        expect(importer.nonrecurring_event?(recurring_event)).to be false
      end

      it "should return true on events that are nonrecurring" do
        expect(importer.nonrecurring_event?(nonrecurring_event)).to be true
      end
    end

    describe "#recurring_event?" do
      it "should return false on events that are not recurring" do
        expect(importer.recurring_event?(nonrecurring_event)).to be false
      end

      it "should return true on events that are recurring" do
        expect(importer.recurring_event?(recurring_event)).to be true
      end
    end

    describe "#find_events" do

      it "should find events that fall within the specified date range" do
        expect(importer.events.size).to eq 1
      end

      it "should not find events that fall outside the specified range" do
        start_date = Date.today.beginning_of_year - 1.year
        end_date = start_date.end_of_month
        calendar = load_calendar(start_date: start_date,
                                 end_date: end_date)
        ical_events = calendar.parsed_icalendar.events
        event_importer = EventImporter.new(config: calendar.config,
                                           icalendar_events: ical_events)
        expect(event_importer.events.size).to eq 0
      end

    end
  end
end
