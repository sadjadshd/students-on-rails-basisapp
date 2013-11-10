class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /wishlists
  # GET /wishlists.json
  def index
    @wishlists = Wishlist.all
  end

  # GET /wishlists/1
  # GET /wishlists/1.json
  def show
    
    @wishes = Wish.where('wishlist_id = ?', params[:id])
    
    if current_user == nil
      @is_owner = false
    else
      @is_owner = current_user.id == Wishlist.find(params[:id]).user_id
      @wish = Wish.new
      @wish.name = "New Wish"
      @wish.wishlist_id = params[:id]
    end
  end

  # GET /wishlists/new
  def new
    @wishlist = Wishlist.new
  end

  # GET /wishlists/1/edit
  def edit
  end

  # POST /wishlists
  # POST /wishlists.json
  def create
    @wishlist = Wishlist.new(wishlist_params)

    @wishlist.user = current_user

    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wishlist }
      else
        format.html { render action: 'new' }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wishlists/1
  # PATCH/PUT /wishlists/1.json
  def update
    respond_to do |format|
      if @wishlist.update(wishlist_params)
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlists/1
  # DELETE /wishlists/1.json
  def destroy
    @wishlist.destroy
    respond_to do |format|
      format.html { redirect_to wishlists_url }
      format.json { head :no_content }
    end
  end

  def send_list
    wishlist = Wishlist.find(params[:id])
    WishlistMailer.wishlist_email(wishlist, params[:email]).deliver
    redirect_to wishlists_url 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist
      @wishlist = Wishlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wishlist_params
      params.require(:wishlist).permit(:name, :description)
    end
end
