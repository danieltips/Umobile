require 'rho/rhocontroller'
require 'helpers/browser_helper'

class PromedioController < Rho::RhoController
  include BrowserHelper

  # GET /Promedio
  def index
    @promedios = Promedio.find(:all)
    render :back => '/app'
  end

  # GET /Promedio/{1}
  def show
    @promedio = Promedio.find(@params['id'])
    if @promedio
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Promedio/new
  def new
    @promedio = Promedio.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Promedio/{1}/edit
  def edit
    @promedio = Promedio.find(@params['id'])
    if @promedio
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Promedio/create
  def create
    @promedio = Promedio.create(@params['promedio'])
    redirect :action => :index
  end

  # POST /Promedio/{1}/update
  def update
    @promedio = Promedio.find(@params['id'])
    @promedio.update_attributes(@params['promedio']) if @promedio
    redirect :action => :index
  end

  # POST /Promedio/{1}/delete
  def delete
    @promedio = Promedio.find(@params['id'])
    @promedio.destroy if @promedio
    redirect :action => :index  
  end
end
