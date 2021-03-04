require 'httpx'
class Api::V1::PostsController < ApplicationController
    def index
        request_api('https://jsonplaceholder.typicode.com/todos')
        
        return nil if @response.status !=200
        render json: JSON.parse(@response.body)
    end

    private

    def request_api(url)
        @response=HTTPX.get(url) 
    end

end
