class ParentController < ApplicationController

    def show
        @parent = Parent.find_by(uid: params[:id])
        if @parent.nil?
            flash[:danger] = 'Could not find that person.'
            redirect_to '/'
        end
    end

    def search
        @parents = Parent.where(searchable_params)
    end



    private
        def searchable_params
            params.slice(:name)
        end
end
