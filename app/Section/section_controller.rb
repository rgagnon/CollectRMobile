require 'rho/rhocontroller'
require 'helpers/browser_helper'

class SectionController < Rho::RhoController
  include BrowserHelper

  # GET /Section
  def index
    @sections = Section.find(:all)
    render :back => '/app'
  end

  # GET /Section/{1}
  def show
    @section = Section.find(@params['id'])
    if @section
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Section/new
  def new
    @section = Section.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Section/{1}/edit
  def edit
    @section = Section.find(@params['id'])
    if @section
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Section/create
  def create
    @section = Section.create(@params['section'])
    redirect :action => :index
  end

  # POST /Section/{1}/update
  def update
    @section = Section.find(@params['id'])
    @section.update_attributes(@params['section']) if @section
    redirect :action => :index
  end

  # POST /Section/{1}/delete
  def delete
    @section = Section.find(@params['id'])
    @section.destroy if @section
    redirect :action => :index  
  end
end
