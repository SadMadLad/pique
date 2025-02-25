class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  class << self
    delegate :sample, to: :all
  end
end
