class AddDescriptionAndDueDateToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :description, :text
    add_column :projects, :due_date, :date
  end

  def self.down
    remove_column :projects, :due_date
    remove_column :projects, :description
  end
end
