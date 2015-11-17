class Repo < ActiveRecord::Base
  belongs_to :user

  validates :rid, presence: true
  validates :rid, uniqueness: true, if: -> { self.rid.present? }
end
