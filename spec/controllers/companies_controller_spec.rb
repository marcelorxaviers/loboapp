require 'spec_helper'

describe CompaniesController do
  login_user

  let(:valid_attributes) do
    (FactoryGirl.build :company).attributes.symbolize_keys.select {|_, value| !value.nil? }
  end

  let(:invalid_attributes) {{
    "name" => "",
    "highrise_base_url" => "https://personal1788.highrisehq.com",
    "highrise_token" => "EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
  }}

  describe "GET join" do
    describe "company without current user as company member" do
      it "adds curent user to company member list" do
        company = FactoryGirl.create(:company)
        get :join, {:company_id => company.to_param}
        Company.last.users.should include(User.last)
      end
    end

    describe "company with current user as company member" do
      it "keeps curent user to company member list" do
        company = FactoryGirl.create(:company)
        get :join, {:company_id => company.to_param}
        Company.last.users.should include_only_one_of(User.last)
      end
    end
  end

  describe "GET leave" do
    it "removes curent user to company member list" do
      company = FactoryGirl.create(:company)
      company.users.push(User.last)
      get :leave, {:company_id => company.to_param}
      Company.last.users.should_not include(User.last)
    end
  end

  describe "GET index" do
    it "assigns all companies as @companies" do
      company = FactoryGirl.create(:company)
      get :index, {}
      assigns(:companies).should eq([company])
    end
  end

  describe "GET show" do
    it "assigns the requested company as @company" do
      company = FactoryGirl.create(:company)
      get :show, {:id => company.to_param}
      assigns(:company).should eq(company)
    end
  end

  describe "GET new" do
    it "assigns a new company as @company" do
      get :new, {}
      assigns(:company).should be_a_new(Company)
    end
  end

  describe "GET edit" do
    it "assigns the requested company as @company" do
      company = FactoryGirl.create(:company)
      get :edit, {:id => company.to_param}
      assigns(:company).should eq(company)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Company" do
        expect {
          post :create, {:company => valid_attributes}
        }.to change(Company, :count).by(1)
      end

      it "assigns a newly created company as @company" do
        post :create, {:company => valid_attributes}
        assigns(:company).should be_a(Company)
        assigns(:company).should be_persisted
      end

      it "redirects to the created company" do
        post :create, {:company => valid_attributes}
        response.should redirect_to(Company.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved company as @company" do
        # Trigger the behavior that occurs when invalid params are submitted
        Company.any_instance.stub(:save).and_return(false)
        post :create, {:company => invalid_attributes}
        assigns(:company).should be_a_new(Company)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Company.any_instance.stub(:save).and_return(false)
        post :create, {:company => invalid_attributes}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested company" do
        company = FactoryGirl.create(:company)
        Company.any_instance.should_receive(:update).with({
          "highrise_token" => "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
        })
        put :update, {:id => company.to_param, :company => {
          "highrise_token" => "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
        }}
      end

      it "assigns the requested company as @company" do
        company = FactoryGirl.create(:company)
        put :update, {:id => company.to_param, :company => valid_attributes}
        assigns(:company).should eq(company)
      end

      it "redirects to the company" do
        company = FactoryGirl.create(:company)
        put :update, {:id => company.to_param, :company => valid_attributes}
        response.should redirect_to(company)
      end
    end

    describe "with invalid params" do
      it "assigns the company as @company" do
        company = FactoryGirl.create(:company)
        Company.any_instance.stub(:save).and_return(false)
        put :update, {:id => company.to_param, :company => invalid_attributes}
        assigns(:company).should eq(company)
      end

      it "re-renders the 'edit' template" do
        company = FactoryGirl.create(:company)
        Company.any_instance.stub(:save).and_return(false)
        put :update, {:id => company.to_param, :company => invalid_attributes}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested company" do
      company = FactoryGirl.create(:company)
      expect {
        delete :destroy, {:id => company.to_param}
      }.to change(Company, :count).by(-1)
    end

    it "redirects to the companies list" do
      company = FactoryGirl.create(:company)
      delete :destroy, {:id => company.to_param}
      response.should redirect_to(companies_url)
    end
  end
end
