require 'rails_helper'

RSpec.describe Snippet, type: :model do
  describe "validations" do
    it "requires a title" do
      s = Snippet.new(work:"def method end")
      expect(s).to be_invalid
    end
    it "requires a snippet (work)" do
      s = Snippet.new(title: "ruby code")
      expect(s).to be_invalid
    end
  end
end
