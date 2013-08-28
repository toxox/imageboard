require "spec_helper"

describe EmptyNameHelper do
  describe "set_name_to_anon_if_empty" do
    describe "with non-empty name" do
      let(:discussion) { FactoryGirl.create(:discussion) }

      it "should have proper name" do
        expect(discussion.name).to eq(discussion.name)
      end
    end

    describe "with empty name" do
      let(:discussion) { FactoryGirl.create(:discussion, name: '') }

      it "should have change the name" do
        expect(discussion.name).to eq("Anon")
      end
    end
  end
end