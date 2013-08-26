require 'spec_helper'

describe Post do
  let(:discussion) { FactoryGirl.create(:discussion) }

  before do
    @post = Post.new(name: "Name", comment: "Comment",
     discussion_id: discussion.id)
  end

  subject { @post }

  it { should respond_to(:name) }
  it { should respond_to(:comment) }
  it { should respond_to(:discussion_id) }
  it { should respond_to(:no_bump) }

  it { should respond_to(:discussion) }

  it { should be_valid }

  it { should ensure_length_of(:name).is_at_most(25) }

  it { should validate_presence_of(:comment) }
  it { should ensure_length_of(:comment).is_at_most(5000) }

  it { should belong_to(:discussion) }

  describe "when name is empty" do
    before do
      @post.name = ''
      @post.save!
    end

    it "should set name to 'Anon'" do
      expect(@post.name).to eq('Anon')
    end
  end

  describe "when bump limit is reached" do
    before do
      #This is kind of slow, obviously.
      #Can't realy think of anything better right now
      302.times do
        @post = Post.new(name: "Name", comment: "Comment",
          discussion_id: discussion.id)
        @post.save
      end
    end
    it "should not_update last_post_at" do
      expect(discussion.last_post_at.sec).not_to eq(@post.created_at.sec)
    end
  end

  describe ImageUploader do
    include CarrierWave::Test::Matchers

    before do
      ImageUploader.enable_processing = true
      @uploader = ImageUploader.new(@post, :image)
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