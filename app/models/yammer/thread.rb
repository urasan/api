module Yammer
  class Thread < ActiveRecord::Base
    has_many :messages
  end
end
