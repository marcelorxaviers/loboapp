require 'spec_helper'

describe ContactsController do
  login_user

  let(:valid_attributes) do
    (FactoryGirl.build :contact).attributes.symbolize_keys.select {|_, value| !value.nil? }
  end

  let(:invalid_attributes) {{
    "first_name" => "nome",
    "last_name" => "sobrenome",
    "email" => "",
    "company_name" => "umbrella corp",
    "job_title" => "researcher",
    "phone" => "2345678"
  }}

  describe "GET index" do
    it "assigns all contacts as @contacts" do
      company = FactoryGirl.create(:company)
      contact = FactoryGirl.create(:contact)
      contact.company = company
      get :index, {:company_id => company.to_param }
      assigns(:contacts).should eq([contact])
    end
  end

  describe "GET show" do
    it "assigns the requested contact as @contact" do
      company = FactoryGirl.create(:company)
      contact = FactoryGirl.create(:contact)
      contact.company = company
      get :show, {:id => contact.to_param, :company_id => company.to_param}
      assigns(:contact).should eq(contact)
    end
  end

  describe "GET new" do
    it "assigns a new contact as @contact" do
      company = FactoryGirl.create(:company)
      get :new, {:company_id => company.to_param}
      assigns(:contact).should be_a_new(Contact)
    end
  end

  describe "GET edit" do
    it "assigns the requested contact as @contact" do
      company = FactoryGirl.create(:company)
      contact = FactoryGirl.create(:contact)
      contact.company = company
      get :edit, {:id => contact.to_param, :company_id => company.to_param}
      assigns(:contact).should eq(contact)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Contact" do
        company = FactoryGirl.create(:company)
        expect {
          post :create, {:contact => valid_attributes, :company_id => company.to_param}
        }.to change(Contact, :count).by(1)
      end

      it "assigns a newly created contact as @contact" do
        company = FactoryGirl.create(:company)
        post :create, {:contact => valid_attributes, :company_id => company.to_param}
        assigns(:contact).should be_a(Contact)
        assigns(:contact).should be_persisted
      end

      it "redirects to the contacts list (on the company page)" do
        company = FactoryGirl.create(:company)
        post :create, {:contact => valid_attributes, :company_id => company.to_param}
        response.should redirect_to(company_url(company))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved contact as @contact" do
        company = FactoryGirl.create(:company)
        Contact.any_instance.stub(:save).and_return(false)
        post :create, {:contact => invalid_attributes, :company_id => company.to_param}
        assigns(:contact).should be_a_new(Contact)
      end

      it "re-renders the 'new' template" do
        company = FactoryGirl.create(:company)
        Contact.any_instance.stub(:save).and_return(false)
        post :create, {:contact => invalid_attributes, :company_id => company.to_param}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested contact" do
        company = FactoryGirl.create(:company)
        contact = FactoryGirl.create(:contact)
        contact.company = company
        Contact.any_instance.should_receive(:update).with({ "first_name" => "outro nome" })
        put :update, {:id => contact.to_param, :company_id => company.to_param, :contact => { "first_name" => "outro nome" }}
      end

      it "assigns the requested contact as @contact" do
        company = FactoryGirl.create(:company)
        contact = FactoryGirl.create(:contact)
        company.save
        contact.company = company
        contact.save
        put :update, {:id => contact.to_param, :contact => valid_attributes, :company_id => company.to_param}
        assigns(:contact).should eq(contact)
      end

      it "redirects to the contacts list (on the company page)" do
        company = FactoryGirl.create(:company)
        contact = FactoryGirl.create(:contact)
        company.save
        contact.company = company
        contact.save
        put :update, {:id => contact.to_param, :contact => valid_attributes, :company_id => company.to_param}
        response.should redirect_to(company_url(company))
      end
    end

    describe "with invalid params" do
      it "assigns the contact as @contact" do
        company = FactoryGirl.create(:company)
        contact = FactoryGirl.create(:contact)
        contact.company = company
        Contact.any_instance.stub(:save).and_return(false)
        put :update, {:id => contact.to_param, :contact => invalid_attributes, :company_id => company.to_param}
        assigns(:contact).should eq(contact)
      end

      it "re-renders the 'edit' template" do
        company = FactoryGirl.create(:company)
        contact = FactoryGirl.create(:contact)
        contact.company = company
        Contact.any_instance.stub(:save).and_return(false)
        put :update, {:id => contact.to_param, :contact => invalid_attributes, :company_id => company.to_param}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested contact" do
      company = FactoryGirl.create(:company)
      contact = FactoryGirl.create(:contact)
      company.save
      contact.company = company
      contact.save
      expect {
        delete :destroy, {:id => contact.to_param, :company_id => company.to_param}
      }.to change(Contact, :count).by(-1)
    end

    it "redirects to the contacts list (on the company page)" do
      company = FactoryGirl.create(:company)
      contact = FactoryGirl.create(:contact)
      company.save
      contact.company = company
      contact.save
      delete :destroy, {:id => contact.to_param, :company_id => company.to_param}
      response.should redirect_to(company_url(company))
    end
  end

end
