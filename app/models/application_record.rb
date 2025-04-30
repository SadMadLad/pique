class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  scope :randomize, -> { order("random()") }

  class << self
    delegate :sample, to: :all
  end
end
