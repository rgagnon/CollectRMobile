require 'rho/rhocontroller'
require 'helpers/browser_helper'

class FormController < Rho::RhoController
  include BrowserHelper

  # GET /Form
  def index
    @forms = Form.find(:all)
    render :back => '/app'
  end

  # GET /Form/{1}
  def show
    @form = Form.find(@params['id'])
    if @form
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Form/new
  def new
    @form = Form.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Form/{1}/edit
  def edit
    @form = Form.find(@params['id'])
    if @form
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Form/create
  def create
    @form = Form.create(@params['form'])
    redirect :action => :index
  end

  # POST /Form/{1}/update
  def update
    @form = Form.find(@params['id'])
    @form.update_attributes(@params['form']) if @form
    redirect :action => :index
  end

  # POST /Form/{1}/delete
  def delete
    @form = Form.find(@params['id'])
    @form.destroy if @form
    redirect :action => :index  
  end
end
