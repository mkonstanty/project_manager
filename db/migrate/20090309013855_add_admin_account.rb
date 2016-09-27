class AddAdminAccount < ActiveRecord::Migration
  def self.up
    User.create(:login => "admin", :password => "admin", :password_confirmation => "admin", :is_admin => true)
  end

  def self.down
  end
end
