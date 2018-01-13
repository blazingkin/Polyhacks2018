class IndexController < ApplicationController

    def index
        unless @current_user.nil?
            @jobs = JobListing.all
            @jobs = @jobs.page(params[:page])
        end
    end

end
