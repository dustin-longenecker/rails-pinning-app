class PinsController < ApplicationController

  def index
    @pins = Pin.all
  end

  def show
    @pin = Pin.find(params[:id])
  end
  
  def show_by_name
     @pin = Pin.find_by_slug(params[:slug])
     render :show
  end

  def new
     @pin = Pin.new
  end

  #def create
   # @pin = Pin.create(pin_params)
    #redirect :show
  #end
  def create
    @pin = Pin.create(pin_params)
    @pin.save!
    #if @pin.save!
      redirect_to show
    #else
    #  render :new
    #end
  end
  def edit
    @pin = Pin.find(params[:id])
    render :edit
  end
  def update
    @pin = Pin.find(params[:id])
    @pin.update_attributes(pin_params)
    @pin.save
    redirect_to show
  end
  
  private
  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :category_id)
  end
end

