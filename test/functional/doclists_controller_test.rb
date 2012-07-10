require 'test_helper'

class DoclistsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Doclist.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Doclist.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Doclist.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to doclist_url(assigns(:doclist))
  end

  def test_edit
    get :edit, :id => Doclist.first
    assert_template 'edit'
  end

  def test_update_invalid
    Doclist.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Doclist.first
    assert_template 'edit'
  end

  def test_update_valid
    Doclist.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Doclist.first
    assert_redirected_to doclist_url(assigns(:doclist))
  end

  def test_destroy
    doclist = Doclist.first
    delete :destroy, :id => doclist
    assert_redirected_to doclists_url
    assert !Doclist.exists?(doclist.id)
  end
end
