class Repository
  def find_all
    Merchant.all()
  end
  
  def find(merchant_id)
    Merchant.find(merchant_id)
  end

  def new_merchant(*args)
    Merchant.new(*args)
  end

  def update(merchant, merchant_attrs)
    merchant.update(merchant_attrs)
  end

  def save(merchant)
    merchant.save
  end
end

class MerchantsController < ApplicationController
  before_action :set_merchant, only: %i[ show edit update destroy ]

  # GET /merchants or /merchants.json
  def index
    @merchants = repo.find_all
  end


  # GET /merchants/1 or /merchants/1.json
  def show
  end

  # GET /merchants/new
  def new
    @merchant = repo.new_merchant
  end

  # GET /merchants/1/edit
  def edit
  end

  # POST /merchants or /merchants.json
  def create
    # @merchant = Merchant.new(merchant_params)
    @merchant = repo.new_merchant(merchant_params)
    respond_to do |format|
      if @merchant.save
        format.html { redirect_to merchant_url(@merchant), notice: "Merchant was successfully created." }
        format.json { render :show, status: :created, location: @merchant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchants/1 or /merchants/1.json
  def update
    respond_to do |format|
      # if @merchant.update(merchant_params)
      if repo.update(merchant_params)
        format.html { redirect_to merchant_url(@merchant), notice: "Merchant was successfully updated." }
        format.json { render :show, status: :ok, location: @merchant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchants/1 or /merchants/1.json
  def destroy
    @merchant.destroy!

    respond_to do |format|
      format.html { redirect_to merchants_url, notice: "Merchant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def merchant_params
      params.require(:merchant).permit(:owner_name, :email, :store_name, :description, :logo, :has_storefront)
    end

    def repo
      @repo ||= Repository.new
    end
end
