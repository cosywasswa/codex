class RemoveColumnVideoFileFromVideos < ActiveRecord::Migration[7.0]
  def change
    remove_column :videos, :video_file
  end
end
