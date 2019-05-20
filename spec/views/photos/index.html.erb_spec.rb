# require 'rails_helper'
#
# RSpec.describe "photos/index", type: :view do
#   let!(:user) {create(:user)}
#   let!(:profile) {create(:profile, user: user)}
#
#
#   before :each do
#     @photos = assign(:photo, [Photo.create!(photos: "", description: "caca-test", user: user),
#                             Post.create!(photos: "", description: "caca2-test", user: user])
#     allow(view).to receive_messages(:will_paginate => nil)
#   end
#
#   it "should show a photos" do
#     render
#     expect(@photos[0].photo).to eq(nil)
#     expect(rendered).to include nil
#   end
#
# end
