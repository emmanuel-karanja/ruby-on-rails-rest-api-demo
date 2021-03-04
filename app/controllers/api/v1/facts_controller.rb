class Api::V1::FactsController < ApplicationController
    before_action:find_fact, only: [:show,:update,:destroy]
    def index
        @facts=Fact.all
        render json: @facts
    end

    def show
        render json: @fact
    end

    def create
        @fact=Fact.create(fact_params)
        if @fact.valid?
            render json: @fact
        else
            render json: { 
                errors: @fact.errors
                #error_codes: @fact.errors.keys.map { |f| f.upcase + "_ERROR" }
              },
              status: 422
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
        params.permit(:fact,:likes,:user_id)
    end

    def find_fact
        @fact=Fact.find(params[:id])
        puts @fact
    end
end
