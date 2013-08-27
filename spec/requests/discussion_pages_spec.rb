require "spec_helper"

describe "Discussion pages" do
  subject { page }

  describe "discussion page" do
    let(:board) { FactoryGirl.create(:board) }
    let(:discussion) { FactoryGirl.create(:discussion, board_id: board.id) }

    before do
      visit board_discussion_path(board, discussion)
    end

    after { Discussion.delete_all }

    it { should have_selector("h2", text: board.name) }
    it { should have_selector("h3", text: "/#{board.short_name}/") }
    it { should have_title("#{discussion.subject} - #{board.name}") }

    it { should have_content(discussion.name) }
    it { should have_content(discussion.subject) }
    it { should have_content(discussion.comment) }
    it { should have_content(discussion.image) }

    describe "when discussion is open" do
      it { should have_selector("form") }
      it { should have_css("input#post_name") }
      it { should have_css("textarea#post_comment") }
      it { should have_css("input#post_image") }
      it { should have_css("input#post_no_bump") }
      it { should have_selector("input") }
    end

    describe "when discussion is closed" do
      before do
        discussion.closed = true
        discussion.save!
        visit board_discussion_path(board, discussion)
      end

      it { should_not have_selector("form") }
      it { should_not have_css("input#post_name") }
      it { should_not have_css("textarea#post_comment") }
      it { should_not have_css("input#post_image") }
      it { should_not have_css("input#post_no_bump") }
      it { should_not have_selector("input") }
    end

    describe "creating a post" do
      before do
        fill_in "Name", with: "Example Name"
        fill_in "Comment", with: "Example Comment"
        check "No bump"
        click_button "Create Post"
      end

      it "should create new post" do
        expect(discussion.posts.count).to eq(1)
      end

      it { should have_content("Example Name") }
      it { should have_content("Example Comment") }
    end

    describe "Back to board link" do
      before do
        click_link "Back to Board"
      end

      it { should have_selector("h2", text: board.name) }
      it { should have_selector("h3", text: "/#{board.short_name}/") }
      it { should have_title("/#{board.short_name}/ - #{board.name}") }
    end
  end
end