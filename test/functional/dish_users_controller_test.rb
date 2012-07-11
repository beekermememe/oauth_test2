require 'test_helper'

class DishUsersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => DishUser.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    DishUser.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    DishUser.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to dish_user_url(assigns(:dish_user))
  end

  def test_edit
    get :edit, :id => DishUser.first
    assert_template 'edit'
  end

  def test_update_invalid
    DishUser.any_instance.stubs(:valid?).returns(false)
    put :update, :id => DishUser.first
    assert_template 'edit'
  end

  def test_update_valid
    DishUser.any_instance.stubs(:valid?).returns(true)
    put :update, :id => DishUser.first
    assert_redirected_to dish_user_url(assigns(:dish_user))
  end

  def test_destroy
    dish_user = DishUser.first
    delete :destroy, :id => dish_user
    assert_redirected_to dish_users_url
    assert !DishUser.exists?(dish_user.id)
  end
end
