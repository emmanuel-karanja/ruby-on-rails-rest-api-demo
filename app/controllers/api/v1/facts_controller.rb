class Api::V1::FactsController < ApplicationController
    def index
        @facts=Fact.all
        render json: @facts
    end

    def show
        render json: @fact
    end

    def create
        @fact=Fact.new(fact_params)
        if @fact.save
            render json: @fact
        else
            render error: { error: 'Unable to create Fact.'},status: 400
        end
    end

    def update
        if @fact
            @fact.update(fact_params)
            render json: {message: 'Fact successfully updated.'},status: 200
        else
            render json: {error: 'Unable to update Fact.'},status: 400
        end
    end

    def destroy
        if @fact
            @fact.destroy
            render json: {message:'Fact successfully deleted.'},status: 200
        else
            render json: {error: 'Unable to delete Fact.'},status: 400
        end
    end

    private 

    def fact_params
        params.require(:fact).permit(:fact,:likes,:user_id)
    end

    def find_fact
        @fact=Fact.find(params[:id])
    end
end
