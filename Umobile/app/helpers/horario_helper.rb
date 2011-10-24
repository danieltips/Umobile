require 'date'

module HorarioHelper


  
  def obtenerdia(value)
    
    nombredia =  ''
    
    
    case value.to_i()
           when 0
      nombredia =  'Domingo'
           when 1
      nombredia =  'Lunes'
           when 2
      nombredia =  'Martes'
           when 3
      nombredia =  'Miercoles'
           when 4
      nombredia =  'Jueves'
           when 5
      nombredia =  'Viernes'
           when 6
      nombredia =  'Sabado'
           else
      nombredia =  ''
         end   
    
   return  nombredia 
  
  
  end
  
  
  

    
  
end
