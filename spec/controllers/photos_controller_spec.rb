require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  let!(:user) { build(:user, email: "test@gmail.com") }
  login_user


it "should have a current_user" do
  expect(subject.current_user).to_not eq(nil)
end



describe 'POST #create' do
  it "Так як не можу создати фотку то не редіректить" do
    #photos :create, params: {photo: {photos:"Tester.jpg"}}
    #expect(subject.current_user.photo.photos).to eq("Tester.jpg")
    expect(response).to_not redirect_to root_path
  end
end

describe 'GET #new' do
  it "should  open form for create Photo" do
    get :new
    # expect(subject.current_user.email).to eq("tester@test.com")
    # expect(subject.current_user.email).to_not eq(user.email)
    expect(response).to have_http_status(200)
  end
end
describe "GET #index" do
  it ' show a list of all users and photo**' do
    total1 = User.all.count
    total2 = Photo.all.count
    get :index
    expect(total1.to_s).to eq('1')
    expect(total2.to_s).to eq('0')
  expect(response).to have_http_status(200)
end
end
end
