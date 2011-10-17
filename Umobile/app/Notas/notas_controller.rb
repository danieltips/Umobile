require 'rho/rhocontroller'
require 'helpers/browser_helper'

class NotasController < Rho::RhoController
  include BrowserHelper

  # GET /Notas
  def index
    @notases = Notas.find(:all)
    render :back => '/app'
  end

  # GET /Notas/{1}
  def show
    @notas = Notas.find(@params['id'])
    if @notas
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end
  
  def showNotas
      @notas = Notas.find(@params['id'])
      if @notas
        render :action => :show, :back => url_for(:action => :index)
      else
        redirect :action => :index
      end
    end
  
  # GET /Notas/new
  def new
    @notas = Notas.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Notas/{1}/edit
  def edit
    @notas = Notas.find(@params['id'])
    if @notas
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Notas/create
  def create
    @notas = Notas.create(@params['notas'])
    redirect :action => :index
  end

  # POST /Notas/{1}/update
  def update
    @notas = Notas.find(@params['id'])
    @notas.update_attributes(@params['notas']) if @notas
    redirect :action => :index
  end

  # POST /Notas/{1}/delete
  def delete
    @notas = Notas.find(@params['id'])
    @notas.destroy if @notas
    redirect :action => :index  
  end
end
