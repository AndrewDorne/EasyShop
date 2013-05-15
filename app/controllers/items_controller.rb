class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    @search = Item.search do
      fulltext params[:search]
    end
    @items = @search.results

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  def results
    @rsize = params[:rsize]
    if @rsize.blank?
       @rsize = "2"
    end
    num_per_page = 1
    if @rsize == "1"
       num_per_page = 9
    end
    if @rsize == "2"
       num_per_page = 4
    end
    if @rsize == "3"
       num_per_page = 2
    end

    @sterm = params[:search]
    @search = Item.search do
      fulltext params[:search]
      if params[:category_ids]
        with(:category_ids, params[:category_ids])
      end
      order_map = {"relevance" => :score, "alpha" => :name, "price" => :price}
      direction_map = {"asc" => :asc, "desc" => :desc}
      if params[:order] and order_map.has_key?(params[:order])
        order = order_map[params[:order]]
        if params[:direction] and direction_map.has_key?(params[:direction])
          direction = direction_map[params[:direction]]
          order_by(order, direction)
        else
          order_by(order, :asc)
        end
      end
      paginate :page => params[:page], :per_page => num_per_page
    end
    @items = @search.results

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end
