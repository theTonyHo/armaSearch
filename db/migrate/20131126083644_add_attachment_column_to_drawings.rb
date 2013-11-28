class AddAttachmentColumnToDrawings < ActiveRecord::Migration
  def self.up
    add_attachment :drawings, :attachment
  end

  def self.down
    remove_attachment :drawings, :attachment
  end
end