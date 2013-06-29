require 'spec_helper'

describe "DiscussionPages" do
  let(:discussion) { FactoryGirl.create(:discussion) }
  before { visit discussion_path(discussion) }

  subject { page }

  it { should have_content("Create new post") }

  describe "when discussion has no posts" do
    before { discussion.posts = []}

    it { should_not have_content("Posts") }
  end

  describe "when creating post" do
    let(:post) { FactoryGirl.create(:post) }
    before do
      fill_in "Name",    with: post.name
      fill_in "Comment", with: post.comment

    end

    it "should create a post" do
      expect { click_button "Create Post" }.to change(Post, :count).by(1)
    end
  end

  describe "when discussion has posts" do
    let(:post) { FactoryGirl.create(:post) }
    before do
      fill_in "Name",    with: post.name
      fill_in "Comment", with: post.comment
      click_button "Create Post"
    end

    it {should have_content("Posts") }
    it {should have_content(post.name) }
    it {should have_content(post.comment) }
  end
end
