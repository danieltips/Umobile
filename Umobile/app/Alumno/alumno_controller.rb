require 'rho/rhocontroller'
require 'helpers/browser_helper'

class AlumnoController < Rho::RhoController
  include BrowserHelper

  # GET /Alumno
  def index
    @alumnos = Alumno.find(:all)
    render :back => '/app'
  end

  # GET /Alumno/{1}
  def show
    @alumno = Alumno.find(@params['id'])
    if @alumno
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Alumno/new
  def new
    @alumno = Alumno.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Alumno/{1}/edit
  def edit
    @alumno = Alumno.find(@params['id'])
    if @alumno
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Alumno/create
  def create
    @alumno = Alumno.create(@params['alumno'])
    redirect :action => :index
  end

  # POST /Alumno/{1}/update
  def update
    @alumno = Alumno.find(@params['id'])
    @alumno.update_attributes(@params['alumno']) if @alumno
    redirect :action => :index
  end

  # POST /Alumno/{1}/delete
  def delete
    @alumno = Alumno.find(@params['id'])
    @alumno.destroy if @alumno
    redirect :action => :index  
  end
end
