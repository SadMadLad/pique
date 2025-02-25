class CollectionsController < ApplicationController
  def index
    @collections = Collection.shared
  end
end
