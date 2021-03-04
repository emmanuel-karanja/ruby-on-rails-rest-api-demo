class FilterRoute
      def initialize(app)
         @app = app
      end
       
     def call(env)
       req = Rack::Request.new(env)
       if req.path == "/filter"
        [200, {}, ["route filtered by middleware"]] 
       else
        @app.call(env)
       end
     end
  end