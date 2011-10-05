require 'rho/rhocontroller'
require 'helpers/browser_helper'

class SeccionController < Rho::RhoController
  include BrowserHelper

  # GET /Seccion
  def index
    @seccions = Seccion.find(:all)
    render :back => '/app'
  end

  # GET /Seccion/{1}
  def show
    @seccion = Seccion.find(@params['id'])
    if @seccion
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Seccion/new
  def new
    @seccion = Seccion.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Seccion/{1}/edit
  def edit
    @seccion = Seccion.find(@params['id'])
    if @seccion
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Seccion/create
  def create
    @seccion = Seccion.create(@params['seccion'])
    redirect :action => :index
  end

  # POST /Seccion/{1}/update
  def update
    @seccion = Seccion.find(@params['id'])
    @seccion.update_attributes(@params['seccion']) if @seccion
    redirect :action => :index
  end

  # POST /Seccion/{1}/delete
  def delete
    @seccion = Seccion.find(@params['id'])
    @seccion.destroy if @seccion
    redirect :action => :index  
  end
end
