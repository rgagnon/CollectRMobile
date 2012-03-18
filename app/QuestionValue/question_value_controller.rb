require 'rho/rhocontroller'
require 'helpers/browser_helper'

class QuestionValueController < Rho::RhoController
  include BrowserHelper

  # GET /QuestionValue
  def index
    @questionvalues = QuestionValue.find(:all)
    render :back => '/app'
  end

  # GET /QuestionValue/{1}
  def show
    @questionvalue = QuestionValue.find(@params['id'])
    if @questionvalue
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /QuestionValue/new
  def new
    @questionvalue = QuestionValue.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /QuestionValue/{1}/edit
  def edit
    @questionvalue = QuestionValue.find(@params['id'])
    if @questionvalue
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /QuestionValue/create
  def create
    @questionvalue = QuestionValue.create(@params['questionvalue'])
    redirect :action => :index
  end

  # POST /QuestionValue/{1}/update
  def update
    @questionvalue = QuestionValue.find(@params['id'])
    @questionvalue.update_attributes(@params['questionvalue']) if @questionvalue
    redirect :action => :index
  end

  # POST /QuestionValue/{1}/delete
  def delete
    @questionvalue = QuestionValue.find(@params['id'])
    @questionvalue.destroy if @questionvalue
    redirect :action => :index  
  end
end
