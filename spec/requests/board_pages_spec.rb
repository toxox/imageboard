require 'spec_helper'

describe "Board pages" do
  subject { page }

  describe "board page" do
    let(:board) { FactoryGirl.create(:board) }

    before do
      visit board_path(board.id)
    end

    it { should have_selector("h2", text: board.name) }
    it { should have_selector("h3", text: "/#{board.short_name}/") }
    it { should have_title("/#{board.short_name}/ - #{board.name}") }

    it { should have_selector("form") }
    it { should have_css("input#discussion_name") }
    it { should have_css("input#discussion_subject") }
    it { should have_css("textarea#discussion_comment") }
    it { should have_css("input#discussion_image") }
    it { should have_selector("input") }

    describe "creating discussions" do
      before do
        fill_in "Name", with: "Example Name"
        fill_in "Comment", with: "Example Comment"
        fill_in "Subject", with: "Example Subject"
        click_button "Create Discussion"
        visit board_path(board.id)
      end

      it "should create a discussion" do
        expect(board.discussions.count).to eq(1)
      end

      it { should have_content("Example Name") }
      it { should have_content("Example Comment") }
      it { should have_content("Example Subject") }
    end

    describe "showing last three posts of discussion" do
      before do
        @discussion = Discussion.new(name: "Name", subject: "Subject",
                  comment: "Comment", board_id: board.id, image: "test.png")
        @discussion.save!
        4.times do |n|
          @post = Post.new(name: "Name#{n+1}", comment: "Comment#{n+1}",
                                discussion_id: @discussion.id)
          @post.save!
        end
        visit board_path(board.id)
      end

      it { should_not have_content "Comment1"}
      it { should_not have_content "Name1"}

      it { should have_content "Comment2"}
      it { should have_content "Name2"}
      it { should have_content "Comment3"}
      it { should have_content "Name3"}
      it { should have_content "Comment4"}
      it { should have_content "Name4"}
    end

    describe "pagination" do
      before do
        14.times do
          @discussion = Discussion.new(name: "Name", subject: "Subject",
                  comment: "Comment", board_id: board.id, image: "test.png")
          @discussion.save!
        end
        visit board_path(board.id)
      end

      it { should have_css("ul.pagination") }
    end
  end
end