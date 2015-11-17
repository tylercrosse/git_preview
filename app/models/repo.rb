class Repo < ActiveRecord::Base
  validates :rid, presence: true
  validates :rid, uniqueness: true, if: -> { self.rid.present? }
end
