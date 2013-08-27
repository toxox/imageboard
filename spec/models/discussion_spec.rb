require 'spec_helper'

describe Discussion do
  let(:board) { FactoryGirl.create(:board) }

  before do
    @discussion = Discussion.new(name: "Name", subject: "Subject",
                  comment: "Comment", board_id: board.id, image: "test.png")
  end

  subject { @discussion }

  it { should respond_to(:name) }
  it { should respond_to(:subject) }
  it { should respond_to(:comment) }
  it { should respond_to(:board_id) }
  it { should respond_to(:last_post_at) }
  it { should respond_to(:sticky) }
  it { should respond_to(:closed) }
  it { should respond_to(:image) }


  it { should respond_to(:posts) }
  it { should respond_to(:board) }

  it { should be_valid }


  it { should validate_presence_of(:comment) }
  it { should ensure_length_of(:comment).is_at_most(5000) }

  it { should validate_presence_of(:subject) }
  it { should ensure_length_of(:subject).is_at_most(50) }

  it { should ensure_length_of(:name).is_at_most(30) }

  it { should validate_presence_of(:board_id) }
  it { should validate_numericality_of(:board_id) }

  it { should have_many(:posts).dependent(:destroy) }
  it { should belong_to(:board) }

  describe "when name is empty" do
    before do
      @discussion.name = ''
      @discussion.save!
    end

    it "should set name to 'Anon'" do
      expect(@discussion.name).to eq('Anon')
    end
  end

  describe "when post is created" do
    before do
      @discussion.save!
      @post = Post.new(name: "Name", comment: "Comment",
                  discussion_id: @discussion.id )
      @post.save!
    end

    it "should update last_post_at" do
      #Time is not identical in this case.
      #Thus, testing for matching minutes and seconds
      expect(@discussion.last_post_at.min).to eq(@post.created_at.min)
      expect(@discussion.last_post_at.sec).to eq(@post.created_at.sec)
    end
  end

  describe "when destroying old discussions" do
    before do
      21.times do
        @discussion = Discussion.new(name: "Name", subject: "Subject",
                  comment: "Comment", board_id: board.id, image: "test.png")
        @discussion.save!
      end
    end
    it "should destroy old discussions" do
      expect(board.discussions.count).to eq(20)
    end
  end

  describe ImageUploader do
    include CarrierWave::Test::Matchers

    before do
      ImageUploader.enable_processing = true
      @uploader = ImageUploader.new(@discussion, :image)
      @uploader.store!(File.open("./app/assets/images/rails.png"))
    end

    after do
      ImageUploader.enable_processing = false
      @uploader.remove!
    end

    context 'the thumb version' do
      it "should scale down to maximum of 200 by 200 px" do
        @uploader.thumb.should be_no_larger_than(200, 200)
      end
    end

  end
end