require 'spec_helper'

describe "boards/edit" do
  before(:each) do
    @board = assign(:board, stub_model(Board,
      :name => "MyString",
      :short_name => "MyString"
    ))
  end

  it "renders the edit board form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", board_path(@board), "post" do
      assert_select "input#board_name[name=?]", "board[name]"
      assert_select "input#board_short_name[name=?]", "board[short_name]"
    end
  end
end
