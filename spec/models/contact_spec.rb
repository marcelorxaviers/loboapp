require 'spec_helper'

describe Contact do
  describe "associations" do
    it { should belong_to(:company) }
  end

  describe "attribute validation" do
    describe "first name" do
      it { should validate_presence_of(:first_name) }
      it { should ensure_length_of(:first_name).is_at_least(3).is_at_most(60) }

      it { should_not allow_value("").for(:first_name) }

      it { should allow_value("Roberto").for(:first_name) }
      it { should allow_value("Roberto Jorge").for(:first_name) }
    end

    describe "last name" do
      it { should validate_presence_of(:last_name) }
      it { should ensure_length_of(:last_name).is_at_least(3).is_at_most(60) }

      it { should_not allow_value("").for(:last_name) }

      it { should allow_value("Lobo").for(:last_name) }
      it { should allow_value("Lobo Filho").for(:last_name) }
    end

    describe "email" do
      it { should validate_presence_of(:email) }

      it { should_not allow_value("").for(:email) }      
      it { should_not allow_value("abcde").for(:email) }
      it { should_not allow_value("@email.com").for(:email) }

      it { should allow_value("rhlobo@alt.drycode.it").for(:email) }
      it { should allow_value("rhlobo+loboapp@gmail.com").for(:email) }
    end
  end 
end
