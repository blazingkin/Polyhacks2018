class ParentController < ApplicationController

    def show
        @parent = Parent.find_by(uid: params[:id])
        if @parent.nil?
            flash[:danger] = 'Could not find that person.'
            redirect_to '/'
        end
    end

    def edit
        @parent = current_user
    end

    def update
        @parent = current_user
        if @parent.update_attributes(profile_params)
            redirect_to '/parent/' + @parent.uid.to_s
        else
           flash[:danger] = @parent.errors
           redirect_to edit_profile_path 
        end
    end

    def search
        @parents = Parent.where(searchable_params)
    end



    private
        def searchable_params
            params.slice(:name)
        end

        def profile_params
            params['parent']&.permit(:email, :phone_number, :bio)
        end
end
