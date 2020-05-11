require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "associations" do 
    it { should belong_to(:author) }

    it { should have_many(:comments) }

    it { should have_many(:likes) }
  end
end
