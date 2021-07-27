class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper.to_json
        else
            render json: { error: "Camper not found"}, status: 404
        end
    end

    def create
        camper = Camper.create(camper_params)
        # camper = Camper.new(camper_params)

        # if camper.save
        if camper.valid?
            render json: camper, status: 201
        else
            render json: { errors: camper.errors.full_messages}, status: 422
        end
    end


    private

    def camper_params
        params.permit(:name, :age)
    end
end
