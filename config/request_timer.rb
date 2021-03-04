
class RequestTimer                                                                                                                                         
    def initialize(app)                                                                                                                                      
     @app = app                                                                                                                                              
    end                                                                                                                                                      

    def call(env)                                                                                                                                            
      start_time = Time.now                                                                                                                                  
      status, headers, response = @app.call(env)                                                                                                             
      stop_time = Time.now                                                                                                                                   
      [status, headers, response.body]                                                                                                                       
    end                                                                                                                                                      
end 