class Comment <ApplicationRecord
    belongs_to :video
    belongs_to :user
    validates :description, presence: true
end