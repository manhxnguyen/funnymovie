class Movie < ApplicationRecord
  belongs_to :user
  has_many :reactions

  def youtube_id
    if self.link.present?
      if self.link.include?('/') && self.link.include?('youtu')
        link = self.link.split('/')
        if link.present?
          link.last
        else
          nil
        end
      else
        nil
      end
    else
      nil
    end
  end
end
