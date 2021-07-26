class SignupsController < ApplicationController
    def create
        signup = Signup.create(signup_params) 
        if signup.valid?
            render json: signup
        else
            render json: { error: "validation errors"}, status: 403
        end
    end

    def signup_params
        params.require(:signup).permit(:time, :camper_id, :activity_id)
    end
end
