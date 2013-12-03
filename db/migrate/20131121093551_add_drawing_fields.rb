class AddDrawingFields < ActiveRecord::Migration
  def change
    add_column :drawings, :name, :string
    add_column :drawings, :title, :string
    add_column :drawings, :series, :string
    add_column :drawings, :revision, :string
    add_column :drawings, :is_part, :boolean
  end
end
