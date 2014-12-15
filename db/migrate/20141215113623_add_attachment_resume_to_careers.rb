class AddAttachmentResumeToCareers < ActiveRecord::Migration
  def self.up
    change_table :careers do |t|
      t.attachment :resume
    end
  end

  def self.down
    remove_attachment :careers, :resume
  end
end