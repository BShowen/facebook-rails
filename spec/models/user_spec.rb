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
end
