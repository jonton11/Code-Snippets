class KindsController < ApplicationController # :nodoc:
  def show
    @kind = Kind.find params[:id]
  end
end
