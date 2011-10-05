class Application < Rhosync::Base
  class << self
    def authenticate(username,password,session)
      puts "USER:#{username}"
           success = false 
           
     
                @base = "http://pdsoluciones.com/RESTfullWCF/WidgetManager.svc/Alumno/" + "#{username}" + "/#{password}" 
                  parsed=JSON.parse(RestClient.get(@base).body)
                  puts parsed.inspect
         
                  #    puts "estoy poniendo el id  #{parsed[0]["alumno"]["codigo"]}"
                    
            if(     parsed[0]["alumno"]["codigo"]== username)
                   
                   puts "entro:#{username}"
                   success = true
                   #Store.put_value("#{username}:password", username)
                   Store.put_value('user',username)
                   Store.put_value('pass',password)
                   puts "verificamos #{Store.get_value('user')}"
                   
     
            else  
                   raise "LOGIN/PASSWORD ERROR : #{username} : #{password}" 
            end
                   
     
            
           
          return  parsed[0]["alumno"]["nombre"]

    end
    
    # Add hooks for application startup here
    # Don't forget to call super at the end!
    def initializer(path)
      super
    end
    
    # Calling super here returns rack tempfile path:
    # i.e. /var/folders/J4/J4wGJ-r6H7S313GEZ-Xx5E+++TI
    # Note: This tempfile is removed when server stops or crashes...
    # See http://rack.rubyforge.org/doc/Multipart.html for more info
    # 
    # Override this by creating a copy of the file somewhere
    # and returning the path to that file (then don't call super!):
    # i.e. /mnt/myimages/soccer.png
    def store_blob(object,field_name,blob)
      super #=> returns blob[:tempfile]
    end
  end
end

Application.initializer(ROOT_PATH)