require 'rho/rhocontroller'
require 'helpers/browser_helper'

require 'date'

class HorarioController < Rho::RhoController
  include BrowserHelper


  # GET /Horario

           

  def index
    puts "probando:#{@params['dia']}"
    
    
    if( @params['dia'])
    @dia = @params['dia'].to_i()
      puts "probando:#{@dia}"
   
    else
    @dia = Time.now.wday 
    end  
  
    puts "probando:#{@dia}"
   
   
    cond1 = {
      :conditions => { 
        {  :name => 'dia', :op => '='  } => @dia, 
        {  :name => 'recuperacion', :op => '='} => 0
       }, 
      :op => 'AND'
    }
  
    cond2 = {
      :conditions => 
      { { :name => 'dia',  :op => '='  } => @dia,
        {  :name => 'recuperacion',  :op => '='} => 1,
        {  :name => 'fecha',  :op => 'LIKE' } => Time.now.strftime("%d/%m/%Y")  
      },
      :op => 'AND'
    }       
                    
  @horarios = Horario.find(:all, :conditions =>[cond1,cond2], :op => 'OR', :order => 'horainicio' )
  
puts "probando:#{@horarios}"

  render :back => '/app'
  
  
   end
  

  # GET /Horario/{1}
  def show
    
    puts "que dia s:#{@params['dia']}"
       
    if( @params['dia'])
    dia = @params['dia'].to_i()
      puts "probando:#{dia}"
        
    end
    

    cond1 = {
      :conditions => { 
        {  :name => 'dia', :op => '='  } => dia, 
        {  :name => 'recuperacion', :op => '='} => 0
       }, 
      :op => 'AND'
    }
  
    cond2 = {
      :conditions => 
      { { :name => 'dia',  :op => '='  } => dia,
        {  :name => 'recuperacion',  :op => '='} => 1,
        {  :name => 'fecha',  :op => 'LIKE' } => Time.now.strftime("%d/%m/%Y")  
      },
      :op => 'AND'
    }       
                    
  @horarios = Horario.find(:all, :conditions =>[cond1,cond2], :op => 'OR', :order => 'horainicio' )
  render :back => '/app'
  
  end

  # GET /Horario/new
  def new
    @horario = Horario.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Horario/{1}/edit
  def edit
    @horario = Horario.find(@params['id'])
    if @horario
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Horario/create
  def create
    @horario = Horario.create(@params['horario'])
    redirect :action => :index
  end

  # POST /Horario/{1}/update
  def update
    @horario = Horario.find(@params['id'])
    @horario.update_attributes(@params['horario']) if @horario
    redirect :action => :index
  end

  # POST /Horario/{1}/delete
  def delete
    @horario = Horario.find(@params['id'])
    @horario.destroy if @horario
    redirect :action => :index  
  end
end
