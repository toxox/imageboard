require 'spec_helper'

describe Board do
  let(:board) { FactoryGirl.create :board }

  it { should respond_to(:name) }
  it { should respond_to(:short_name) }
  it { should respond_to(:discussions) }
end
