class JobController < ApplicationController

    def show
        @job = JobListing.find_by(params[:id])
        if @job.nil?
            flash[:danger] = 'Could not find that job listing'
            redirect_to '/'
        end
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

    private
        def job_params
            params.permit(:info)
        end

end
