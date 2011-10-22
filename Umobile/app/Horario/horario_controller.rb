require 'rho/rhocontroller'
require 'helpers/browser_helper'

class HorarioController < Rho::RhoController
  include BrowserHelper

  # GET /Horario


  def index
      time = Time.now
      dia = time.wday.to_i()
      
      puts dia.to_s()
      
      case dia
        when 1
           WebView.navigate (url_for :action => :lunes)  
        when 2
           WebView.navigate (url_for :action => :martes)  
        when 3
             WebView.navigate (url_for :action => :miercoles)  
        when 4
           WebView.navigate (url_for :action => :jueves)  
        when 5
          WebView.navigate (url_for :action => :viernes)  
        when 6
          WebView.navigate (url_for :action => :sabado)  
        else
           WebView.navigate (url_for :action => :lunes)  
      end   
      render :back => '/app'
   end
  
    def lunes
      time = Time.now
      
      @horarios  = Horario.find( :all)

      render :back => '/app'
    end
  
    def martes
      @horarios = Horario.find(:all)
      render :back => '/app'
    end
  
    def miercoles
      @horarios = Horario.find(:all)
      render :back => '/app'
    end
  
    def jueves
      @horarios = Horario.find(:all)
      render :back => '/app'
    end
  
    def viernes
      @horarios = Horario.find(:all)
      render :back => '/app'
    end
  
  
    def sabado
      time = Time.now

        
      cond1 = {
        :conditions => { 
          {  :name => 'dia', :op => '='  } => time.wday, 
          {  :name => 'recuperacion', :op => '='} => 0
         }, 
        :op => 'AND'
      }

      cond2 = {
        :conditions => 
        { { :name => 'dia',  :op => '='  } => time.wday,
          {  :name => 'recuperacion',  :op => '='} => 0
        #  {  :func => 'to_date' :name => 'fecha',  :op => '=' } => Time.now.to_date },
        },
        :op => 'AND'
      }       
                      
    @horarios = Horario.find(:all, :conditions =>[cond1,cond2],
                              :op => 'OR',   
                              :order => 'horainicio'
                          )
         
    render :back => '/app'
          
    end

  
  
  # GET /Horario/{1}
  def show
    @horario = Horario.find(@params['id'])
    if @horario
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
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
