require 'rails_helper'

RSpec.describe Like, type: :model do



  context "association" do
    it { should belong_to(:photo) }
    it { should belong_to(:user) }
  end



  describe "validation" do
    subject{
      build(:user)
    }

    it "не знаю як но воно працює(унікальний id)" do
      expect(subject).to be_valid
    end
  end
end
