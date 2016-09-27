class AccountsController < ApplicationController

  before_filter :login_required, :only => [:edit]

  def index
  end

  def login
    return unless request.post?
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      redirect_back_or_default(:controller => '/accounts', :action => 'index')
      flash[:notice] = "Zalogowano."
    end
  end

  def edit
    return unless request.post?
    self.current_user.password = params[:user][:password]
    self.current_user.password_confirmation = params[:user][:password_confirmation]
    begin
      self.current_user.save!
    rescue
    end

    render :action => :edit
#     redirect_back_or_default(:controller => '/accounts', :action => 'index')
#     flash[:notice] = "Dane zaktualizowane."
  end

#   def signup
#     @user = User.new(params[:user])
#     return unless request.post?
#     @user.save!
#     self.current_user = @user
#     redirect_back_or_default(:controller => '/accounts', :action => 'index')
#     flash[:notice] = "Thanks for signing up!"
#   rescue ActiveRecord::RecordInvalid
#     render :action => 'signup'
#   end
  
  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default(:controller => '/accounts', :action => 'index')
  end
end
