class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]
  before_action :set_user, only: %i[index new create show edit update destroy]

  # GET /orders
  # GET /orders.json
  def index
    if params[:product_id].present?
      @pagy, @orders = pagy(Order.search(params[:product_id], nil, @user.id), items: 100)
    elsif params[:sku].present?
      @pagy, @orders = pagy(Order.search(nil, params[:sku], @user.id), items: 100)
    else
      @pagy, @orders = pagy(Order.search(nil, nil, @user.id), items: 100)
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @page_title = @order.name
  end

  # GET /orders/new
  def new
    @products = @user.products
    @inventories = Inventory.where(product_id: @products).order(created_at: :desc)
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit; end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    accessible = %i[product_id inventory_id street_address apartment city state country_code zip phone_number email name status payment_ref transaction_id payment_amt_cents ship_charged_cents ship_cost_cents subtotal_cents total_cents shipper_name payment_date shipped_date tracking_number tax_total_cents]
    params.require(:order).permit(accessible)
  end
end
