class ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    the_review = Review.new
    the_review.comment = params.fetch('comment_input')
    the_review.score = params.fetch('stars')
    the_review.course_id = params.fetch('course_id')

    the_review.save

    flash[:notice] = 'Your Review Has Been Submited'
    redirect_back(fallback_location: home_path)
  end
end
