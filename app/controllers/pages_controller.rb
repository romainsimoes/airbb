class PagesController < ApplicationController
  layout 'home'
  skip_before_action :authenticate_user!

  def home
    @children = Child.all
  end

end
