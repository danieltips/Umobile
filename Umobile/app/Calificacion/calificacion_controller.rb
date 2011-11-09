require 'rho/rhocontroller'
require 'helpers/browser_helper'

class CalificacionController < Rho::RhoController
  include BrowserHelper

  # GET /Calificacion
  def index   
    filtro = @params['filtro'].to_i()        
    if( filtro == 0)
      @cursos = Curso.find(:all)                
        
    #  @calificacions = Calificacion.find(:all)
    else
      @cursos = Curso.find(:all, :conditions => ["id IN (?)",  [170,65] ] )               
    #  @calificacions = Calificacion.find(:all)
      #render :back => '/app'
    end      
    
    render :back => '/app/Calificacion/index'
  end

  def indexCursos
    @cursos = Curso.find(:all)
    render :back => '/app/Calificacion/indexCursos'
  end  

  # GET /Calificacion/{1}
  def show
    id = @params['id'].to_s()       
    #puts " Mostrar : #{id}" 
    @curso = Curso.find(:all, :conditions => {:id => id.to_s()})
    @curso.inspect
    @CalificacionesCurso = Calificacion.find(:all, :conditions => {:idcurso => id.to_s()})   
    #@CalificacionesCurso = Calificacion.find(@params['id'])  
    puts @CalificacionesCurso
    render :back => '/app/Calificacion/show'   
  end

  # GET /Calificacion/new
  def new
    @calificacion = Calificacion.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Calificacion/{1}/edit
  def edit
    @calificacion = Calificacion.find(@params['id'])
    if @calificacion
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Calificacion/create
  def create
    @calificacion = Calificacion.create(@params['calificacion'])
    redirect :action => :index
  end

  # POST /Calificacion/{1}/update
  def update
    @calificacion = Calificacion.find(@params['id'])
    @calificacion.update_attributes(@params['calificacion']) if @calificacion
    redirect :action => :index
  end

  # POST /Calificacion/{1}/delete
  def delete
    @calificacion = Calificacion.find(@params['id'])
    @calificacion.destroy if @calificacion
    redirect :action => :index  
  end
end
