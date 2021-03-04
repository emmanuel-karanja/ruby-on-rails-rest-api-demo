require 'rack'
class RequestTimer                                                                                                                                         

    def initialize(app)                                                                                                                                      
     @app = app                                                                                                                                              
    end                                                                                                                                                      

    def call(env)                                                                                                                                            
      start_time = Time.now                                                                                                                                  
      status, headers, body= @app.call(env)                                                                                                             
      stop_time = Time.now                                                                                                                                   
      [status, headers, body]                                                                                                                       
    end                                                                                                                                                      

  end 