class HaikusController < ApplicationController
  def new
    @haiku = Haiku.new
  end
  
  def create
    @haiku = Haiku.new params[:haiku]
    if @haiku.save
      redirect_to haikus_path
    else
      render :action => :new
    end
  end
  
  def index
    @haikus = Haiku.find(:all, :order => "id DESC", :limit => 5)
  end
end
