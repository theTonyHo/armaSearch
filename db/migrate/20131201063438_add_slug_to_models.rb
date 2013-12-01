class AddSlugToModels < ActiveRecord::Migration
  def change
    add_column :projects, :slug, :string
    add_column :drawings, :slug, :string
    add_column :parts, :slug, :string

    add_index :projects, :slug, unique: true
    add_index :drawings, :slug, unique: true
    add_index :parts, :slug, unique: true
  end
end
