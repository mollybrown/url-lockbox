class Link < ActiveRecord::Base
  validates :link, :url => true

end
