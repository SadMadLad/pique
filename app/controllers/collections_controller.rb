class CollectionsController < ApplicationController
  def index
    @collection = Collection.all
  end
end
