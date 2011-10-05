require 'rho/rhocontroller'
require 'helpers/browser_helper'

class PeriodoController < Rho::RhoController
  include BrowserHelper

  # GET /Periodo
  def index
    @periodos = Periodo.find(:all)
    render :back => '/app'
  end

  # GET /Periodo/{1}
  def show
    @periodo = Periodo.find(@params['id'])
    if @periodo
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Periodo/new
  def new
    @periodo = Periodo.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Periodo/{1}/edit
  def edit
    @periodo = Periodo.find(@params['id'])
    if @periodo
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Periodo/create
  def create
    @periodo = Periodo.create(@params['periodo'])
    redirect :action => :index
  end

  # POST /Periodo/{1}/update
  def update
    @periodo = Periodo.find(@params['id'])
    @periodo.update_attributes(@params['periodo']) if @periodo
    redirect :action => :index
  end

  # POST /Periodo/{1}/delete
  def delete
    @periodo = Periodo.find(@params['id'])
    @periodo.destroy if @periodo
    redirect :action => :index  
  end
end
