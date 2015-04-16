class HomeController < ApplicationController

  def index
    # TODO: Eager load
    @cohort = Cohort.current.first
    @programs = Program.order(:title)
  end
end
