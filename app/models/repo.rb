class Repo < ActiveRecord::Base
  belongs_to :user
  has_many :commits, dependent: :destroy

  validates :rid, presence: true
  validates :rid, uniqueness: true, if: -> { self.rid.present? }
end
