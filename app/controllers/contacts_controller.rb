class ContactsController < ApplicationController
  def create
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = @company.contacts.new(contact_params)
    @contact.save
    redirect_to company_jobs_path(@company)
  end

private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :position, :email, :company_id)
  end
end