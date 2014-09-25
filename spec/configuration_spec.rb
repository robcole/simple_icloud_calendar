require 'spec_helper'

module SimpleIcloudCalendar
  describe Configuration do

    let(:valid_config) { create_valid_config }

    describe "#initialize" do
      it "default start_date is beginning_of_month" do
        expect(valid_config.start_date).to eq Date.today.beginning_of_month

      end
      it "default end_date is start_date + 28 days" do
        default_start_date = Date.today.beginning_of_month
        expect(valid_config.end_date).to eq default_start_date + 28.days
      end
    end

    describe "#start_date=" do
      it "can set a different start date" do
        valid_config.start_date = Date.parse("31-10-2014")
        expect(valid_config.start_date).to eq Date.parse("31-10-2014")
      end

      it "expects a valid date object" do
        invalid_start_date = Time.now
        expect{valid_config.start_date = invalid_start_date}.
          to raise_error("Expects a Date Object")
      end
    end

    describe "#end_date=" do
      it "can set a different end date" do
        valid_end_date = valid_config.start_date + 7.days
        valid_config.end_date = valid_end_date
        expect(valid_config.end_date).to eq valid_end_date
      end

      it "expects a valid date" do
        invalid_end_date = Time.now
        expect{valid_config.end_date = invalid_end_date}.
          to raise_error("Expects a Date Object")
      end

      it "can not set an end date before a start date" do
        invalid_end_date = valid_config.start_date - 7.days
        expect{valid_config.end_date = invalid_end_date}.
          to raise_error("End Date Cannot Be Before Start Date")
      end
    end

  end
end
