require 'http'
class Api::V1::PostsController < ApplicationController
    def index
        request_api('https://jsonplaceholder.typicode.com/todos')
        
        return nil if @response.status !=200
        render json: @response.parse
    end

    private

    def request_api(url)
        @response=HTTP.get(url)
    end

end
