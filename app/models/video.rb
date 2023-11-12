class Video < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user
    validates :title, presence: true
    validates :description, presence: true
    validates :video_file, presence: true
end