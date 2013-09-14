class Link < ActiveRecord::Base
  belongs_to :user	
  attr_accessible :title, :url

  validates :url, format: {
    with:    URI::regexp(%w(http https)),
    message: 'must begin with a http://'
  } 
end



