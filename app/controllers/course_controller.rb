class CourseController < ApplicationController
  def search
    # TODO: if no input
    @input = params[:course]
    puts(@input.to_s)
  end
end
