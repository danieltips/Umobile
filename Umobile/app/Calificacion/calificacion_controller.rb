require 'rho/rhocontroller'
require 'helpers/browser_helper'

class CalificacionController < Rho::RhoController
  include BrowserHelper

  # GET /Calificacion
  def index
    @cursos = Curso.find(:all)
    @calificacions = Calificacion.find(:all)
    render :back => '/app'
  end

  def indexCursos
    @cursos = Curso.find(:all)
    render :back => '/app/Calificacion/indexCursos'
  end  
  
  # GET /Calificacion/{1}
  def show
    id = @params["idcurso"].to_i()       
    puts " Mostrar : #{id}" 
    @CalificacionesCurso = Calificacion.find(:all, :conditions => {:idcurso => id })   
    puts " Mostrar : #{@CalificacionesCurso}" 
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
