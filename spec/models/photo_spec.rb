require 'rails_helper'

RSpec.describe Photo, type: :model do
  let!(:user){create(:user)}

  # subject{
  #    build(:photo, user: user)
  # }
  # it { should validate_presence_of(:photos) }
  context "association" do
    it { should belong_to(:user) }
    it { should have_many(:likes) }
    it { should have_many(:comments) }
  end

  describe "відсутня валідація для опису(видалити нік без опису або задати валідацію)" do
  it { is_expected.to_not validate_presence_of(:description) }
end

  it "should not be valid without photos" do
     subject.photos = nil
     expect(subject).to_not be_valid
  end



end
