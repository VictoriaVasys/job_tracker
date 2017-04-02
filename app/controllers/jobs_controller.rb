class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = Contact.new
    @contacts = @company.contacts
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @comments = @job.comments.reverse
    @comment = Comment.new
    @contacts = @company.contacts
    @tags = @job.tags
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.destroy
    flash[:success] = "You successfully deleted #{@job.title} at #{@company.name}"
    redirect_to company_jobs_path
  end

  def dashboard
    @count_jobs_by_interest = Job.all.interest
    @top_companies_by_interest = Company.sorted_companies_by_interest[0..2]
    @job_locations = Job.all.location_count
  end

  def sort
    if params[:sort]=='location'
      @jobs_by_location = Job.jobs_by_city.flatten
      render :location
    elsif params[:sort]=="interest"
      @jobs_by_interest = Job.jobs_by_level_of_interest.flatten
      render :interest
    elsif params[:sort]=="company"
      @jobs_by_company = Job.jobs_by_company.flatten
      render :company
    elsif params[:location]
      @jobs_in_city = Job.jobs_for_city(params[:location])
      render :city
    end
  end

  def location

  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, tag_ids: [])
  end
end
