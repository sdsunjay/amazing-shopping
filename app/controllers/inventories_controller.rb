class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[show edit update destroy]
  before_action :set_user, only: %i[index new create show edit update destroy]
  # if we had admin users
  # before_action :check_admin_user, only: %i[edit update destroy]

  # GET /inventories
  # GET /inventories.json
  def index
    if params[:product_id].present?
      @pagy, @inventories = pagy(Inventory.search(params[:product_id], nil, @user.id), items: 100)
    elsif params[:sku].present?
      @pagy, @inventories = pagy(Inventory.search(nil, params[:sku], @user.id), items: 100)
    else
      @pagy, @inventories = pagy(Inventory.search(nil, nil, @user.id), items: 100)
    end
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
    @page_title = @inventory.sku
  end

  # GET /inventories/new
  def new
    @products = @user.products
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit; end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to @inventory, notice: 'Inventory was successfully created.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to @inventory, notice: 'Inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def inventory_params
    accessible = %i[product_id quantity color size weight price_cents sale_price_cents cost_cents sku length width height note]
    params.require(:inventory).permit(accessible)
  end
end
