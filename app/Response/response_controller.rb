require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ResponseController < Rho::RhoController
  include BrowserHelper

  # GET /Response
  def index
    @responses = Response.find(:all)
    render :back => '/app'
  end

  # GET /Response/{1}
  def show
    @response = Response.find(@params['id'])
    if @response
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Response/new
  def new
    @response = Response.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Response/{1}/edit
  def edit
    @response = Response.find(@params['id'])
    if @response
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Response/create
  def create
    @response = Response.create(@params['response'])
    redirect :action => :index
  end

  # POST /Response/{1}/update
  def update
    @response = Response.find(@params['id'])
    @response.update_attributes(@params['response']) if @response
    redirect :action => :index
  end

  # POST /Response/{1}/delete
  def delete
    @response = Response.find(@params['id'])
    @response.destroy if @response
    redirect :action => :index  
  end
end
