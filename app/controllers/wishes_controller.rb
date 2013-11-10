class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :edit, :update, :destroy]

  # GET /wishes
  # GET /wishes.json
  def index
    @wishes = Wish.all
  end

  # GET /wishes/1
  # GET /wishes/1.json
  def show
  end

  # GET /wishes/new
  def new
    @wish = Wish.new
  end

  # GET /wishes/1/edit
  def edit
  end

  # POST /wishes
  # POST /wishes.json
  def create
    @wish = Wish.new(wish_params)
    if Wishlist.find(@wish.wishlist_id).user_id == current_user.id
      @wish.save  
    end
    redirect_to wishlist_path(@wish.wishlist_id)
  end

  # PATCH/PUT /wishes/1
  # PATCH/PUT /wishes/1.json
  def update
    @wish.update(wish_params)
    redirect_to wishlist_path(@wish.wishlist_id)
  end

  # DELETE /wishes/1
  # DELETE /wishes/1.json
  def destroy
    @wish.destroy
    respond_to do |format|
      format.html { redirect_to wishes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish
      @wish = Wish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wish_params
      params.require(:wish).permit(:name, :description, :wishlist_id)
    end
end
