class Admin::UsersController < ApplicationController
  before_filter :admin_required

  active_scaffold :user do |user| 
    user.columns=[:login, :created_at, :is_admin]
    create.columns=[:login, :is_admin, :password, :password_confirmation]
    update.columns=[:login, :is_admin, :password, :password_confirmation]
    show.columns=[:login, :created_at, :is_admin]
  end
end
