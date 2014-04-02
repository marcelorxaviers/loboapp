class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:index, :show, :new, :edit, :create, :destroy]
  before_action :set_company_by_contact_id, only: [:highrise_add, :highrise_remove]

  # GET /companies/:company_id/contacts/:contact_id/highrise_add
  def highrise_add
    def parallel_work
      sleep(10.seconds)
      puts 'done work'
    end
    Thread.new{parallel_work()}

    respond_to do |format|
      format.html { redirect_to authenticated_root_path, notice: "Adding contact '#{@contact.fullname}' to highrise." }
      format.json { head :no_content }
    end
  end

  # GET /companies/:company_id/contacts/:contact_id/highrise_remove
  def highrise_remove
    def parallel_work
      sleep(10.seconds)
      puts 'done work'
    end
    Thread.new{parallel_work()}

    respond_to do |format|
      format.html { redirect_to authenticated_root_path, notice: "Removing contact '#{@contact.fullname}' from highrise." }
      format.json { head :no_content }
    end
  end

  # GET /companies/:company_id/contacts
  def index
    @contacts = Contact.all
  end

  # GET /companies/:company_id/contacts/:id
  def show
  end

  # GET /companies/:company_id/contacts/new
  def new
    @contact = Contact.new
  end

  # GET /companies/:company_id/contacts/:id/edit
  def edit
  end

  # POST /companies/:company_id/contacts
  def create
    @contact = Contact.new(contact_params)
    @contact.company = @company

    respond_to do |format|
      if @contact.save
        format.html { redirect_to company_path(@contact.company), notice: 'Contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/:company_id/contacts/:id
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to company_path(@contact.company), notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/:company_id/contacts/:id
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to company_path(@contact.company) }
      format.json { head :no_content }
    end
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def set_company_by_contact_id
      @contact = Contact.find(params[:contact_id])
    end

    def set_company
      @company = Company.find(params[:company_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:company_id, :first_name, :last_name, :email, :company_name, :job_title, :phone, :website)
    end
end
