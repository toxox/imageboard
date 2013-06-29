require 'spec_helper'

describe "BoardPages" do
  before { visit discussions_path }

  subject { page }

  it { should have_content("Create new thread") }
  it { should have_selector('label', text: "Name") }
  it { should have_selector('label', text: "Subject") }
  it { should have_selector('label', text: "Comment") }

  describe "when creating new discussion" do
    before do
      fill_in "Name",    with: "Firsty"
      fill_in "Subject", with: "Vidya"
      fill_in "Comment", with: "Vidya is dead"
    end

    it "should create new discussion" do
      expect { click_button("Create Discussion") }.to change(Discussion,
                                                               :count).by(1)
    end
  end

  describe "after creating new discussion" do
    let(:discussion) { FactoryGirl.create(:discussion) }
    before do
      fill_in "Name",    with: discussion.name
      fill_in "Subject", with: discussion.subject
      fill_in "Comment", with: discussion.comment
      click_button "Create Discussion"
    end

    it {should have_content("Create new post") }
    it {should have_content(discussion.name) }
    it {should have_content(discussion.subject) }
    it {should have_content(discussion.comment) }
  end

end
