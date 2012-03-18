require 'rho/rhocontroller'
require 'helpers/browser_helper'

class SectionTemplateController < Rho::RhoController
  include BrowserHelper

  # GET /SectionTemplate
  def index
    @sectiontemplates = SectionTemplate.find(:all)
    render :back => '/app'
  end

  # GET /SectionTemplate/{1}
  def show
    @sectiontemplate = SectionTemplate.find(@params['id'])
    if @sectiontemplate
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /SectionTemplate/new
  def new
    @sectiontemplate = SectionTemplate.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /SectionTemplate/{1}/edit
  def edit
    @sectiontemplate = SectionTemplate.find(@params['id'])
    if @sectiontemplate
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /SectionTemplate/create
  def create
    @sectiontemplate = SectionTemplate.create(@params['sectiontemplate'])
    redirect :action => :index
  end

  # POST /SectionTemplate/{1}/update
  def update
    @sectiontemplate = SectionTemplate.find(@params['id'])
    @sectiontemplate.update_attributes(@params['sectiontemplate']) if @sectiontemplate
    redirect :action => :index
  end

  # POST /SectionTemplate/{1}/delete
  def delete
    @sectiontemplate = SectionTemplate.find(@params['id'])
    @sectiontemplate.destroy if @sectiontemplate
    redirect :action => :index  
  end
end
