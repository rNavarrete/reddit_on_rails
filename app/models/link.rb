class Link < ActiveRecord::Base
  belongs_to :user	
  attr_accessible :title, :url
end