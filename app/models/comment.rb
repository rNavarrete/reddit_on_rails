class Comment < ActiveRecord::Base
  attr_accessible :link_id, :message, :user_id
end
