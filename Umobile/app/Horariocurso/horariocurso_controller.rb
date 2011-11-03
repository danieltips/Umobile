require 'rho/rhocontroller'
require 'helpers/browser_helper'

class HorariocursoController < Rho::RhoController
  include BrowserHelper

  # GET /Horariocurso
  def index
    @horariocursos = Horariocurso.find(:all)
    render :back => '/app'
  end

  # GET /Horariocurso/{1}
  def show
    @horariocurso = Horariocurso.find(@params['id'])
    if @horariocurso
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Horariocurso/new
  def new
    @horariocurso = Horariocurso.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Horariocurso/{1}/edit
  def edit
    @horariocurso = Horariocurso.find(@params['id'])
    if @horariocurso
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Horariocurso/create
  def create
    @horariocurso = Horariocurso.create(@params['horariocurso'])
    redirect :action => :index
  end

  # POST /Horariocurso/{1}/update
  def update
    @horariocurso = Horariocurso.find(@params['id'])
    @horariocurso.update_attributes(@params['horariocurso']) if @horariocurso
    redirect :action => :index
  end

  # POST /Horariocurso/{1}/delete
  def delete
    @horariocurso = Horariocurso.find(@params['id'])
    @horariocurso.destroy if @horariocurso
    redirect :action => :index  
  end
end
