require 'rho/rhocontroller'
require 'helpers/browser_helper'

class FormTemplateController < Rho::RhoController
  include BrowserHelper

  # GET /FormTemplate
  def index
    @formtemplates = FormTemplate.find(:all)
    render :back => '/app'
  end

  # GET /FormTemplate/{1}
  def show
    @formtemplate = FormTemplate.find(@params['id'])
    if @formtemplate
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /FormTemplate/new
  def new
    @formtemplate = FormTemplate.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /FormTemplate/{1}/edit
  def edit
    @formtemplate = FormTemplate.find(@params['id'])
    if @formtemplate
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /FormTemplate/create
  def create
    @formtemplate = FormTemplate.create(@params['formtemplate'])
    redirect :action => :index
  end

  # POST /FormTemplate/{1}/update
  def update
    @formtemplate = FormTemplate.find(@params['id'])
    @formtemplate.update_attributes(@params['formtemplate']) if @formtemplate
    redirect :action => :index
  end

  # POST /FormTemplate/{1}/delete
  def delete
    @formtemplate = FormTemplate.find(@params['id'])
    @formtemplate.destroy if @formtemplate
    redirect :action => :index  
  end
end
