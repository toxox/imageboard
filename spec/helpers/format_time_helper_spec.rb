require "spec_helper"

describe FormatTimeHelper do
  let(:test_time) {  Time.zone.parse("2013-08-26 14:58:16") }

  it "should return formatted time" do
    expect(format_time(test_time)).to eq("Mon, 26 August 14:58:16 UTC")
  end
end