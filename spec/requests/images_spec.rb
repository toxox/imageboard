require 'spec_helper'

describe "Images" do
  subject { page }
  let(:board) { FactoryGirl.create(:board) }

  before do
    @discussion = Discussion.new(name: "Name", subject: "Subject",
      comment: "Comment", board_id: board.id,
      image: File.open(File.join(Rails.root, '/spec/support/example.jpg')))
    @discussion.save!
    visit board_path(board.id)
  end
  let(:image) { @discussion.image }

  after do
    @discussion.dest
  end

  it { should have_css(".image-info") }
  it { should have_selector("img") }
  it { should have_link("#{image.filename}", href: image.url) }
  it { should have_content("(#{image.size} B, #{image.width}x#{image.height})") }
  it { should have_content("Thumbnail displayed, click image for full size.") }
end