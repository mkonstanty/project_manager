class AddPriorityAndStatusToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :priority, :integer, :default => 1
    add_column :projects, :status, :integer, :default => 1
  end

  def self.down
    remove_column :projects, :status
    remove_column :projects, :priority
  end
end
