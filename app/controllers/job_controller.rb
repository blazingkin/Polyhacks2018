class JobController < ApplicationController

    def show
        @job = JobListing.find(params[:id])
        if @job.nil?
            flash[:danger] = 'Could not find that job listing'
            redirect_to '/'
        end
    end

    def new
        @job = JobListing.new
    end

    def create
        @job = JobListing.new(job_params)
        @job.parent = current_user
        if @job.save
            redirect_to '/job/' + @job.id.to_s
        else
            flash[:danger] = @job.errors
            redirect_to '/'
        end
    end

    def search
        @jobs = JobListing.all
        @jobs = @jobs.page(params[:page])
    end

    private
        def job_params
            params['job_listing'].permit(:start_time, :end_time, :info)
        end

end
