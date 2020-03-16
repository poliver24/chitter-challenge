class PeepsController < ApplicationController
     
    def index
        @peeps = Peep.all
        @peep = Peep.new
    end

    def create
        # will save and redirect
        @peep = Peep.new(allowed_params)

        if @peep.save
            redirect_to peeps_path
        else
            render 'new'
        end
    end

    def edit
        # will have view
        @peep = Peep.find(params[:id])
    end

    def update
        # will save and redirect
        @peep = Peep.find(params[:id])

        if @peep.update_attributes(allowed_params)
            redirect_to peeps_path
        else
            render 'new'
        end
    end

    def destroy
        # will save and redirect
        @peep = Peep.find(params[:id])

        if @peep.destroy
            redirect_to peeps_path
        else
            Error!
        end
    end

    private

    def allowed_params
        params.require(:peep).permit(:user, :text)
    end

end
