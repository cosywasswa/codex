class Video < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user
    has_one_attached :video_file, dependent: :destroy
    validates :title, presence: true
    validates :description, presence: true
    validates :video_file, presence: true

    def comments_counter
        comments.count
    end

    def likes_counter
        likes.count
    end
end