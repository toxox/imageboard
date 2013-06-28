require 'spec_helper'

describe Discussion do
  let(:discussion) { FactoryGirl.create :discussion }

  subject { discussion }

  it { should respond_to(:id) }
  it { should respond_to(:name) }
  it { should respond_to(:subject) }
  it { should respond_to(:comment) }
  it { should respond_to(:posts) }

  describe "when comment is not present" do
    before { discussion.comment = '' }

    it { should be_invalid }
  end

  describe "when comment is too long" do
    before { discussion.comment = 'a' * 5001 }

    it { should be_invalid }
  end

  describe "when subject is not present" do
    before { discussion.subject = '' }

    it { should be_invalid }
  end

  describe "when subject is too long" do
    before { discussion.subject = 'a' * 51 }

    it { should be_invalid }
  end

  describe "when name is empty" do
    before do
      discussion.name = ''
      discussion.save!
    end

    specify { expect(discussion.name).to eq("Anon") }
  end

  describe "when name is too long" do
    before { discussion.name = 'a' * 31 }

    it { should be_invalid }
  end
end
