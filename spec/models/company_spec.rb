require 'spec_helper'

describe Company do
  describe "associations" do
    it { should belong_to(:user) }
    it { should have_and_belong_to_many(:users) }
    it { should have_many(:contacts) }
  end

  describe "attribute validation" do
    describe "name" do
      it { should validate_uniqueness_of(:name) }
      it { should ensure_length_of(:name).is_at_least(3).is_at_most(30) }

      it { should_not allow_value("").for(:name) }

      it { should allow_value("Empresa").for(:name) }
      it { should allow_value("ACME").for(:name) }
    end

    describe "highrise_token" do
      it { should ensure_length_of(:highrise_token).is_at_least(30).is_at_most(35) }
      it { should_not allow_value("").for(:highrise_token) }

      it { should allow_value("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE").for(:highrise_token) }
      it { should allow_value("ee54dd83345c800c14b6fda0a650659e").for(:highrise_token) }
    end

    describe "highrise_base_url" do
      it { should_not allow_value("").for(:highrise_base_url) }
      it { should_not allow_value("personal1788.highrisehq.com").for(:highrise_base_url) }

      it { should allow_value("https://personal1788.highrisehq.com").for(:highrise_base_url) }
      it { should allow_value("http://xxx.highrise.com/blablablabla").for(:highrise_base_url) }
    end
  end
end
