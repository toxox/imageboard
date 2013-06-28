require 'spec_helper'

describe Post do
  let(:post) { FactoryGirl.create :post }

  subject { post }

  it { should respond_to(:id) }
  it { should respond_to(:discussion_id) }
  it { should respond_to(:name) }
  it { should respond_to(:comment) }

  describe "when discussion_id is not present" do
    before { post.discussion_id = '' }

    it { should be_invalid }
  end

  describe "when discussion_id is not an integer" do
    before { post.discussion_id = 'a string' }

    it { should be_invalid }
  end

  describe "when comment is not present" do
    before { post.comment = '' }

    it { should be_invalid }
  end

  describe "when comment is too long" do
    before { post.comment = 'a' * 5001 }

    it { should be_invalid }
  end

  describe "description" do
    it "should description" do

    end
  end

  describe "when name is empty" do
    before do
      post.name = ''
      post.save!
    end

    specify { expect(post.name).to eq("Anon") }
  end


end
