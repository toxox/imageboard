require 'spec_helper'

describe Board do

  before do
    @board = Board.new(name: "Example board", short_name: "e",
                       number_of_discussions: 10)
  end

  subject { @board }

  it { should respond_to(:name) }
  it { should respond_to(:short_name) }
  it { should respond_to(:number_of_discussions) }
  it { should respond_to(:friendly_id) }

  it { should be_valid }

  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_most(25) }

  it { should validate_presence_of(:short_name) }
  it { should ensure_length_of(:short_name).is_at_most(5) }

  it { should validate_presence_of(:number_of_discussions) }
  it { should validate_numericality_of(:number_of_discussions)
                              .is_greater_than_or_equal_to(1) }

  it { should have_many(:discussions).dependent(:destroy) }

  it "should have matching short_name and friendly_id" do
    expect(@board.short_name).to eq(@board.friendly_id)
  end

end