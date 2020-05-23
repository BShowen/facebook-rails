require 'rails_helper'
require_relative 'rspec_models_helper'

RSpec.describe Post, type: :model do

  #these are all of the helper methods that are called in the tests. 
  include RspecModelsHelper

  let(:user1) { new_valid_user(save: true) }
  let(:post ) { new_valid_post(user: user1)}


  describe "associations" do 
    it { should belong_to(:author) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe "validations" do 
    it "should be valid" do 
      expect(post.valid?).to eql(true)
      expect{post.save!}.to_not raise_error
    end

    it "validates prescence of the author" do 
      post.author = nil
      expect{post.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(post.valid? ).to eql(false)
    end

    it "validates prescence of title" do 
      post.title = nil
      expect{post.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(post.valid?).to eql(false)
    end

    it "validates prescence of body" do 
      post.body = nil
      expect{post.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(post.valid?).to eql(false)
    end
  end
end
