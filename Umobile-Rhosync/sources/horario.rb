class Horario < SourceAdapter
  def initialize(source,credential)
    
    
    user= Store.get_value('user') 
    puts "obtener en horario:#{user}"
    @base = "http://pdsoluciones.com/RESTfullWCF/WidgetManager.svc/Horario/"  + "#{user}"
    super(source,credential)
    
  end
 
  def login
    # TODO: Login to your data source here if necessary
  end
 
  def query(params=nil)
    # TODO: Query your backend data source and assign the records 
    # to a nested hash structure called @result. For example:
#     @result = { 
#       
#       "1"=>{"id"=>"1", "dia"=>"1", "horainicio"=>"12:00", "horafin"=>"14:00", "frecuencia"=>"S", "salon"=>"C45", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a101","curso"=>"mateatica", "idcurso"=>"170", "recuperacion"=>"0", "fecha"=>"" },
#       "2"=>{"id"=>"2", "dia"=>"2", "horainicio"=>"12:00", "horafin"=>"14:00", "frecuencia"=>"S", "salon"=>"B55", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a102","curso"=>"lenguaje", "idcurso"=>"346", "recuperacion"=>"0", "fecha"=>"" },
#       "3"=>{"id"=>"3", "dia"=>"3", "horainicio"=>"12:00", "horafin"=>"14:00", "frecuencia"=>"S", "salon"=>"A10", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a103","curso"=>"ingles", "idcurso"=>"65", "recuperacion"=>"0", "fecha"=>"" },
#       "4"=>{"id"=>"4", "dia"=>"4", "horainicio"=>"12:00", "horafin"=>"14:00", "frecuencia"=>"S", "salon"=>"G11", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"Z104","curso"=>"fisica", "idcurso"=>"329", "recuperacion"=>"0", "fecha"=>"" },
#       "5"=>{"id"=>"5", "dia"=>"5", "horainicio"=>"12:00", "horafin"=>"14:00", "frecuencia"=>"S", "salon"=>"H11", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a101", "curso"=>"mateatica", "idcurso"=>"170", "recuperacion"=>"0", "fecha"=>"" },
#       "6"=>{"id"=>"6", "dia"=>"6", "horainicio"=>"12:00", "horafin"=>"14:00", "frecuencia"=>"S", "salon"=>"F55", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a101", "curso"=>"mateatica", "idcurso"=>"170", "recuperacion"=>"0", "fecha"=>"" },
#       "7"=>{"id"=>"7", "dia"=>"6", "horainicio"=>"12:00", "horafin"=>"14:00", "frecuencia"=>"S", "salon"=>"D43", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a102", "curso"=>"lenguaje", "idcurso"=>"346", "recuperacion"=>"0", "fecha"=>"" },
#       "8"=>{"id"=>"8", "dia"=>"5", "horainicio"=>"10:00", "horafin"=>"12:00", "frecuencia"=>"S", "salon"=>"C23", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a101", "curso"=>"mateatica", "idcurso"=>"170", "recuperacion"=>"0", "fecha"=>"" },
#       "9"=>{"id"=>"9", "dia"=>"1", "horainicio"=>"09:00", "horafin"=>"10:00", "frecuencia"=>"S", "salon"=>"C49", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"C101", "curso"=>"economia", "idcurso"=>"329", "recuperacion"=>"0", "fecha"=>"" },
#       "10"=>{"id"=>"10", "dia"=>"1", "horainicio"=>"15:00", "horafin"=>"17:00", "frecuencia"=>"S", "salon"=>"F35", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a101", "curso"=>"mateatica", "idcurso"=>"170", "recuperacion"=>"1", "fecha"=>"24/10/2011" },
#       "11"=>{"id"=>"11", "dia"=>"2", "horainicio"=>"09:00", "horafin"=>"12:00", "frecuencia"=>"S", "salon"=>"B15", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"B102", "curso"=>"etica", "idcurso"=>"65", "recuperacion"=>"0", "fecha"=>"" }
#       
#     }
#    
#    puts "#{@result}"
     

     parsed=JSON.parse(RestClient.get(@base).body)
     @result={}
     parsed.each { |item| @result[item["horario"]["id"].to_s]=item["horario"] } if parsed
        
        
      @result 

   end
 
  def sync
    # Manipulate @result before it is saved, or save it 
    # yourself using the Rhosync::Store interface.
    # By default, super is called below which simply saves @result
    super
  end
 
  def create(create_hash,blob=nil)
    # TODO: Create a new record in your backend data source
    # If your rhodes rhom object contains image/binary data 
    # (has the image_uri attribute), then a blob will be provided
    raise "Please provide some code to create a single record in the backend data source using the create_hash"
  end
 
  def update(update_hash)
    # TODO: Update an existing record in your backend data source
    raise "Please provide some code to update a single record in the backend data source using the update_hash"
  end
 
  def delete(delete_hash)
    # TODO: write some code here if applicable
    # be sure to have a hash key and value for "object"
    # for now, we'll say that its OK to not have a delete operation
    # raise "Please provide some code to delete a single object in the backend application using the object_id"
  end
 
  def logoff
    # TODO: Logout from the data source if necessary
  end
end