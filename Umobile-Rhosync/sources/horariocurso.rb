class Horariocurso < SourceAdapter
  def initialize(source,credential)
    
    user= Store.get_value('user') 
    puts "obtener en horario por curso:#{user}"
    @base = "http://pdsoluciones.com/RESTfullWCF/WidgetManager.svc/HorarioCurso/"  + "#{user}"
    super(source,credential)
  end
 
  def login
    # TODO: Login to your data source here if necessary
  end
 
  def query(params=nil)
    # TODO: Query your backend data source and assign the records 
    # to a nested hash structure called @result. For example:
    
    
    parsed=JSON.parse(RestClient.get(@base).body)
    @result={}
    parsed.each { |item| @result[item["horariocurso"]["id"].to_s]=item["horariocurso"] } if parsed
       
      
#         @result = { 
#           
#           "1"=>{"id"=>"1", "idcurso"=>"170", "dia"=>"1", "horainicio"=>"12:00", "horafin"=>"14:00", "salon"=>"C45", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a101" },
#           "2"=>{"id"=>"2", "idcurso"=>"170", "dia"=>"1", "horainicio"=>"12:00", "horafin"=>"14:00", "salon"=>"C45", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a101" },
#           "3"=>{"id"=>"3", "idcurso"=>"170", "dia"=>"1", "horainicio"=>"12:00", "horafin"=>"14:00", "salon"=>"C45", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a101" },
#           "4"=>{"id"=>"4", "idcurso"=>"170", "dia"=>"1", "horainicio"=>"12:00", "horafin"=>"14:00", "salon"=>"C45", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a101" },
#           "5"=>{"id"=>"5", "idcurso"=>"170", "dia"=>"1", "horainicio"=>"12:00", "horafin"=>"14:00", "salon"=>"C45", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a101" },
#           "6"=>{"id"=>"6", "idcurso"=>"170", "dia"=>"1", "horainicio"=>"12:00", "horafin"=>"14:00", "salon"=>"C45", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a101" },
#           "7"=>{"id"=>"7", "idcurso"=>"170", "dia"=>"1", "horainicio"=>"12:00", "horafin"=>"14:00", "salon"=>"C45", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a101" },
#           "8"=>{"id"=>"8", "idcurso"=>"170", "dia"=>"1", "horainicio"=>"12:00", "horafin"=>"14:00", "salon"=>"C45", "sede"=>"monterrico", "tipo"=>"teorica", "seccion"=>"a101" },
#
#         }
    
    
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