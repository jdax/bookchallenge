class ValuesController < ApplicationController

  before_filter :header

  def index
    @values = Value.all
  end

end