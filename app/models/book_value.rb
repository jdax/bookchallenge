class BookValue < ActiveRecord::Base
  belongs_to :book
  belongs_to :value
end