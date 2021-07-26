class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper
        else
            render json: { error: "Camper not found"}
        end
    end

    def create
        camper = Camper.create(camper_params)
        if camper.valid?
            render json: camper
        else
            render json: { error: "validation errors"}
        end
    end


    private

    def camper_params
        params.require(:camper).permit(:name, :age)
    end
end
