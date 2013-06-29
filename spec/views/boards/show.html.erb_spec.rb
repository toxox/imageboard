require 'spec_helper'

describe "boards/show" do
  before(:each) do
    @board = assign(:board, stub_model(Board,
      :name => "Name",
      :short_name => "Short Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Short Name/)
  end
end
