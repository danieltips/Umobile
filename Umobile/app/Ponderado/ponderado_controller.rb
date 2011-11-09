require 'rho/rhocontroller'
require 'helpers/browser_helper'

class PonderadoController < Rho::RhoController
  include BrowserHelper

  # GET /Ponderado
  def index
    @ponderados = Ponderado.find(:all)
    render :back => '/app'
  end

  # GET /Ponderado/{1}
  def show
    @ponderado = Ponderado.find(@params['id'])
    if @ponderado
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Ponderado/new
  def new
    @ponderado = Ponderado.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Ponderado/{1}/edit
  def edit
    @ponderado = Ponderado.find(@params['id'])
    if @ponderado
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Ponderado/create
  def create
    @ponderado = Ponderado.create(@params['ponderado'])
    redirect :action => :index
  end

  # POST /Ponderado/{1}/update
  def update
    @ponderado = Ponderado.find(@params['id'])
    @ponderado.update_attributes(@params['ponderado']) if @ponderado
    redirect :action => :index
  end

  # POST /Ponderado/{1}/delete
  def delete
    @ponderado = Ponderado.find(@params['id'])
    @ponderado.destroy if @ponderado
    redirect :action => :index  
  end
end
