class PinsController < ApplicationController
#READ
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
#CREATE
  def new
     @pin = Pin.new  
  end

  def create
    @pin = Pin.create(pin_params)
    @pin.slug = create_slug(@pin)
    @pin.save
    if @pin.persisted?
      redirect_to @pin
    else
      @errors = @pin.errors
      render :new
    end
  end
#UPDATE
  def edit
    @pin = Pin.find(params[:id])
    render :edit
  end
  def update
    @pin = Pin.find(params[:id])
    if @pin.update_attributes(pin_params)
      redirect_to pin_path(@pin)
    else
      @errors = @pin.errors
      render :edit
    end
  end

#DESTROY
  def destroy
    #@pin.delete(pin_params)
    pin = Pin.find(params[:id])
    pin.destroy
    #pin.destroy(pin_params)
    redirect_to root_path, :notice => "Your ppin has been deleted"
  end
#PRIVATE METHODS  
  private
  #pin_params
  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image)
  end
  #generate slug
  def create_slug(pin)
    pin_slug = pin.title.downcase.parameterize(separator: "-")
    pin_slug
  end
end

