class Video < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user
    has_one_attached :video_file
    validates :title, presence: true
    validates :description, presence: true
    validates :category, presence: true

    def video_url
        if video_file.attached?
            Rails.application.routes.url_helpers.rails_blob_url(video_file)
            # polymorphic_url(video_file, disposition: "attachment", only_path: true)
            # Rails.application.routes.url_helpers.rails_storage_proxy_url(video_file)
          end
      end

    def comments_counter
        comments.count
    end

    def likes_counter
        likes.count
    end
end