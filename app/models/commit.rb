class Commit < ActiveRecord::Base
  belongs_to :user
  belongs_to :repo

  validates :sha, presence: true
  validates :sha, uniqueness: true, if: -> { self.sha.present? }

  mount_uploader :screenshot, ImageUploader

end
