class CollectionsController < ApplicationController
  def index
    @collections = Collection.publicly_visible
  end
end
