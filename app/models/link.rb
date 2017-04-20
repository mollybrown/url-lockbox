class Link < ActiveRecord::Base
  validates :url, :url => true
  validates :url, :title, presence: true

  belongs_to :user

  def self.top_ten_links
    Link.order(read_count: :desc).limit(10)
  end

  def hot_link?
    Link.top_ten_links.include?(self)
  end

  def top_link?
    Link.top_ten_links.first == self
  end

end
