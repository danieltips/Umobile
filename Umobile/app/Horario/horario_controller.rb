require 'rho/rhocontroller'
require 'helpers/browser_helper'

require 'date'
require 'time'

class HorarioController < Rho::RhoController
  include BrowserHelper


  # GET /Horario

           

  def index
      
      if( @params['dia'])
       @dia = @params['dia'].to_i()
       else
        @dia = Time.now.wday 
      end        
      puts "#{@dia}"
               
    @horarios = Horario.find(:all, :conditions =>{:dia => @dia}, :op => 'OR', :order => 'horainicio' )
    puts "probando:#{@horarios}"

    render :back => '/app'    
   end
  

  # GET /Horario/{1}
  def show
       
 
  
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
