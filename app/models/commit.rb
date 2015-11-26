class Commit < ActiveRecord::Base
  belongs_to :user
  belongs_to :repo

  validates :sha, presence: true
  validates :sha, uniqueness: true, if: -> { self.sha.present? }

  mount_uploader :screenshot, ImageUploader

  # after_create :add_screenshot
  #
  # def add_screenshot
  #   binding.pry
  #   @screenshot = "https://goo.gl/a63WHE"
  #   puts '*' * 50
  #   puts @screenshot
  #   puts self
  #   puts self.screenshot
  #   self.update(self, screenshot: @screenshot)
  #   puts self.screenshot
  #   binding.pry
  # end
end
