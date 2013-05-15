class CartsController < ApplicationController
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts }
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = Cart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cart }
    end
  end

  def add_to_cart
    @cart = Cart.find(params[:id])
    @item_id = params[:line_item][:item_id]
    @item = Item.find(@item_id)
    @qty = params[:line_item][:quantity].to_i

    if @qty < 0
      respond_to do |format|
        format.html { redirect_to @cart, status: "Unable to update" }
        format.json { render json: {:msg => "Cannot have negative items" }, status: :unprocessable_entity }
      end
    end

    @cart.line_items.where(:item_id => @item_id).destroy_all

    if @qty == 0
      respond_to do |format|
        format.html { redirect_to @cart, notice: 'Removed items'}
        format.json { render json: @cart }
      end
    end

    if @qty > 0
      @qty.times do
        @line_item = @cart.add_item(@item_id)
        @line_item.item = @item
        @line_item.save
      end

      respond_to do |format|
        format.html { redirect_to @cart, notice: 'Updated number of items'}
        format.json { render json: @cart }
      end
    end
  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart }
    end
  end

  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url }
      format.json { head :no_content }
    end
  end
end
