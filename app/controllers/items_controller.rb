# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  helper_method :sort_column, :sort_direction

  # GET /items
  # GET /items.json
  def index
    if params[:itemSearch]
      @items = Item.includes(:location).order("#{sort_column} #{sort_direction}").where('ItemName LIKE ?', "%#{params[:itemSearch]}%")
    else
      @items = Item.includes(:location).order("#{sort_column} #{sort_direction}").all
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show; end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit; end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    unless item_params[:LocId].nil?
      items = Item.where(LocId: item_params[:LocId])
      @item.NumItemId = items.nil? || items.maximum(:NumItemId).nil? ? 1 : (items.maximum(:NumItemId) + 1)
      @item.TextItemId = @item.NumItemId.to_s
      location = @item.location
      @item.ReviewFreq = 0 if @item.ReviewFreq.nil?
      @item.IsTagged = 0 if @item.IsTagged.nil?
      @item.Status = 0 if @item.Status.nil?
    end
    respond_to do |format|
      if !@item.NumItemId.nil? && @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, item: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, item: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.fetch(:item, {})
    params.require(:item).permit(:LocId, :itemSearch)
  end

  def sortable_columns
    %w[NumItemId ItemName Keywords]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : 'NumItemId'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
