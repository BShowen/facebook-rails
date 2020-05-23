require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do 
    it {should have_one(:profile) }

    it {should have_many(:posts) }

    it { should have_many(:comments) }

    it { should have_many(:likes) }

    it {should have_many(:friend_requests_sent) }

    it { should have_many(:friend_requests_received) }
  end

  describe "validations" do 
    context "invalid" do

      def new_user(options = {})

        # create default user params
        user_params = { 
          name: "foo bar", 
          email: "foobar@example.com",
          password: "password"
        }

        #assign new values to the user_params
        options.each {|k,v| user_params[k] = v}

        @user = User.new user_params
      end

      it "when name is not provided" do 
        new_user name: nil
        expect(@user.valid?).to eql false
      end

      it "when email is not provided" do 
        new_user email: nil
        expect(@user.valid?).to eql false
      end

      it "when password is not provided" do 
        new_user password: nil
        expect(@user.valid?).to eql false
      end

    end
  end

end
