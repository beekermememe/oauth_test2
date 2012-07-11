require 'test_helper'

class GoogleUsersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => GoogleUser.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    GoogleUser.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    GoogleUser.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to google_user_url(assigns(:google_user))
  end

  def test_edit
    get :edit, :id => GoogleUser.first
    assert_template 'edit'
  end

  def test_update_invalid
    GoogleUser.any_instance.stubs(:valid?).returns(false)
    put :update, :id => GoogleUser.first
    assert_template 'edit'
  end

  def test_update_valid
    GoogleUser.any_instance.stubs(:valid?).returns(true)
    put :update, :id => GoogleUser.first
    assert_redirected_to google_user_url(assigns(:google_user))
  end

  def test_destroy
    google_user = GoogleUser.first
    delete :destroy, :id => google_user
    assert_redirected_to google_users_url
    assert !GoogleUser.exists?(google_user.id)
  end
end
