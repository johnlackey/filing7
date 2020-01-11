# frozen_string_literal: true

require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  fixtures :all

  setup do
    @location = locations(:location_one)
    @item = items(:item_one)
    # @item.location = @location
    # @item.save
  end

  test 'should get index' do
    assert_not_equal(@item.LocId, 0)
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should fail to create item' do
    assert_no_difference('Item.count') do
      post :create, params: { item: { ItemName: '(open)' } }
    end

    assert_response :success
  end

  test 'should create item' do
    assert_difference('Item.count') do
      post :create, params: { item: { LocId: @location } }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test 'should show item' do
    get :show, params: { id: @item }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @item }
    assert_response :success
  end

  test 'should update item' do
    patch :update, params: { id: @item, item: { ItemName: 'changed name' } }
    assert_redirected_to item_path(assigns(:item))
  end

  test 'should destroy item' do
    assert_difference('Item.count', -1) do
      delete :destroy, params: { id: @item }
    end

    assert_redirected_to items_path
  end
end
