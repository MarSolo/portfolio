class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_admin, only: [:edit, :update, :destroy]
  before_action :authenticate_admin!, except: 
  [:index, :show, :design, :web, :animation, :concept]

 def index
   if params[:tag]
      @pins = Pin.tagged_with(params[:tag])
    else
      @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
    end
 end

 def design
   if params[:tags]
      @pins = Pin.tagged_with("Design", :any => true )
    else
      @pins = Pin.tagged_with("Design", :any => true ).order("created_at DESC")
    end
 end

 def web
   if params[:tags]
      @pins = Pin.tagged_with("Web Design", :any => true )
    else
      @pins = Pin.tagged_with("Web Design", :any => true ).order("created_at DESC")
    end
 end

  def animation
   if params[:tags]
      @pins = Pin.tagged_with("Animation", :any => true )
    else
      @pins = Pin.tagged_with("Animation", :any => true ).order("created_at DESC")
    end
  end

  def concept
   if params[:tags]
      @pins = Pin.tagged_with("Concept Art", :any => true )
    else
      @pins = Pin.tagged_with("Concept Art", :any => true ).order("created_at DESC")
    end
  end

  def show
  end

  def new
    @pin = current_admin.pins.build
  end

  def edit
  end

  def create
    @pin = current_admin.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Image was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Image was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  def tagged
    if params[:tag].present? 
      @pins = Pin.tagged_with(params[:tag])
    else 
      @pins = Pin.postall
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_admin
      @pin = current_admin.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this photo" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :image, :tag_list)
    end
end