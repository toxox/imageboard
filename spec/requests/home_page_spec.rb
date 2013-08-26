require "spec_helper"

describe "Home page" do

  subject { page }
  before { visit root_path }

  it { should have_selector("h1", text: "Hello there!") }
  it { should have_content("Available boards") }
  it { should have_title("Imageboard") }
end