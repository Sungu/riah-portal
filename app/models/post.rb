class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :applicants, dependent: :destroy
    validates :user_id, presence: true
end
