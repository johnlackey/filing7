require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  fixtures :all

  before do
    @location = locations(:location_three)
  end

  it "should get index" do
    get :index
    assert_response :success
    expect(assigns(:locations)).to_not be_nil
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create location" do
    expect{
      post :create, params: { location: { LocName: 'CreateLocation' } }
    }.to change{Location.count}.by(1)

    assert_redirected_to location_path(assigns(:location))
  end

  it "should show location" do
    get :show, params: { id: @location }
    assert_response :success
  end

  it "should get edit" do
    get :edit, params: { id: @location }
    assert_response :success
  end

  it "should update location" do
    patch :update, params: { id: @location, location: { LocName: 'UpdateLocation'  } }
    assert_redirected_to location_path(assigns(:location))
  end

  it "should destroy location" do
    expect{
      delete :destroy, params: { id: @location }
    }.to change{Location.count}.by(-1)

    assert_redirected_to locations_path
  end
end
