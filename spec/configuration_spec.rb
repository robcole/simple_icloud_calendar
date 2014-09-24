require 'spec_helper'

module SimpleIcloudCalendar
  describe Configuration do
    describe "#start_at" do
      it "default value is beginning_of_month" do
        Configuration.new.config.start_at.should eq 'beginning_of_month'
      end
    end

    describe "#start_at=" do
      it "can set value" do
        config = Configuration.new
        config.start_at = 'current_date'
        expect(config.start_at).to eq 'current_date'
      end
    end
  end
end
