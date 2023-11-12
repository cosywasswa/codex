class AddColumnVideoFileToVideos < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :video_file, :string
  end
end
