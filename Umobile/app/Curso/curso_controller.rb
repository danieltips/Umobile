require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'helpers/horario_helper'

class CursoController < Rho::RhoController
  include BrowserHelper
  include HorarioHelper
  
  # GET /Curso
  def index
    @cursos = Curso.find(:all)
    render :back => '/app'
  end

  # GET /Curso/{1}
  def show
    @curso = Curso.find(@params['id'])
    if @curso
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Curso/new
  def new
    @curso = Curso.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Curso/{1}/edit
  def edit
    @curso = Curso.find(@params['id'])
    if @curso
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Curso/create
  def create
    @curso = Curso.create(@params['curso'])
    redirect :action => :index
  end

  # POST /Curso/{1}/update
  def update
    @curso = Curso.find(@params['id'])
    @curso.update_attributes(@params['curso']) if @curso
    redirect :action => :index
  end

  # POST /Curso/{1}/delete
  def delete
    @curso = Curso.find(@params['id'])
    @curso.destroy if @curso
    redirect :action => :index  
  end
  
  
  

  
  
  def cursohorario
    puts "probando:#{@params['idcurso']}"
       id= @params['idcurso'].to_i()
     
                       
    @horarios = Horariocurso.find(:all, :conditions =>{ :idcurso => id},
                            :order => 'dia', :orderdir =>  'ASC' )
      
    @curso = Curso.find(@params['idcurso'])
   
   puts "probando:#{@horarios}"
   
     render :back => '/app'

  end
  
  
  

  
  
end
