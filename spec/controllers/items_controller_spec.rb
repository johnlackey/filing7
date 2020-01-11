# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  fixtures :all

  before do
    @location = locations(:location_one)
    @item = items(:item_one)
  end
  it 'should get index' do
    get :index
    assert_response :success
    expect(assigns(:items)).to_not be_nil
  end

  it 'should get new' do
    get :new
    assert_response :success
  end

  it 'should fail to create item' do
    expect do
      post :create, params: { item: { ItemName: '(open)' } }
    end.to_not change { Item.count }

    assert_response :success
  end

  it 'should create item' do
    expect do
      post :create, params: { item: { LocId: @location } }
    end.to change { Item.count }

    assert_redirected_to item_path(assigns(:item))
  end

  it 'should show item' do
    get :show, params: { id: @item }
    assert_response :success
  end

  it 'should get edit' do
    get :edit, params: { id: @item }
    assert_response :success
  end

  it 'should update item' do
    patch :update, params: { id: @item, item: { ItemName: 'changed name' } }
    assert_redirected_to item_path(assigns(:item))
    @item.reload
    expect(@item[:Status]).to eq(1)
  end

  it 'should destroy item' do
    expect do
      delete :destroy, params: { id: @item }
    end.to change { Item.count }.by(-1)

    assert_redirected_to items_path
  end
end
