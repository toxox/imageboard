require "spec_helper"

describe CommentsHelper do
  describe "make_links" do
    it "should make hyperlinks from ulrs" do
      url = "http://google.com"
      expect(make_links(url)).
                to eq("<a href='http://google.com'>http://google.com</a>")
    end
  end

  describe "filter_comment" do
    it "should apply style to quotes" do
      string = ">implying this is greentext"
      expect(filter_comment(string)).
            to eq("<span class=\"quote\">>implying this is greentext</span>")
    end
  end
end