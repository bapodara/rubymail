require 'test_helper'

class SendmailsControllerTest < ActionController::TestCase
  setup do
    @sendmail = sendmails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sendmails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sendmail" do
    assert_difference('Sendmail.count') do
      post :create, sendmail: { body: @sendmail.body, subject: @sendmail.subject, to: @sendmail.to }
    end

    assert_redirected_to sendmail_path(assigns(:sendmail))
  end

  test "should show sendmail" do
    get :show, id: @sendmail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sendmail
    assert_response :success
  end

  test "should update sendmail" do
    patch :update, id: @sendmail, sendmail: { body: @sendmail.body, subject: @sendmail.subject, to: @sendmail.to }
    assert_redirected_to sendmail_path(assigns(:sendmail))
  end

  test "should destroy sendmail" do
    assert_difference('Sendmail.count', -1) do
      delete :destroy, id: @sendmail
    end

    assert_redirected_to sendmails_path
  end
end
