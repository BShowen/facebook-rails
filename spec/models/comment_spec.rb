require 'rails_helper'
require_relative 'rspec_models_helper'

RSpec.describe Comment, type: :model do

  #these are all of the helper methods that are called in the tests. 
  include RspecModelsHelper

  let(:user1) { create_user(name: "user1", email: "foo@bar.com") }
  let(:user2) { create_user(name: "user2", email: "foo@bar1.com") }
  let(:post1) { user1.posts.create(title: "foo", body: "bar") }
  let(:comment) { new_valid_comment(post: post1, comment_author: user2) }
  
  describe "associations" do 
    it { should belong_to(:author) }
    it { should belong_to(:post) }
  end

  describe "validations" do 
    it "should be valid" do 
      expect(comment.valid?).to eql(true)
      expect{comment.save!}.to_not raise_error
    end

    it "validates presence of author" do 
      comment.author = nil
      expect{comment.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(comment.valid?).to eql(false)
    end

    it "validates presence of body" do 
      comment.body = nil
      expect{comment.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(comment.valid?).to eql(false)
    end

    it "validates presence of post" do 
      comment.post = nil
      expect{comment.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(comment.valid?).to eql(false)
    end
  end
end
