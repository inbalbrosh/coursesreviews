class ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    the_review = Review.new

    the_review.comment = params.fetch('comment_input')
    the_review.score = params.fetch('stars')
    the_review.course_id = params.fetch('course_id')
    the_review.user_id = current_user.id

    if the_review.score == -1
      flash[:error] = 'Must choose score'
    elsif the_review.valid?
      the_review.save
      flash[:notice] = 'Your Review Has Been Submited'
    else
      flash[:error] = the_review.errors.full_messages.to_sentence
    end

    redirect_back(fallback_location: home_path)
  end

  def edit
    review_id = Integer(params.fetch('review_id'), 10)
    the_review = Review.where({ id: review_id }).first
    the_review.comment = params.fetch('comment_input')
    the_review.score = params.fetch('stars')

    if the_review.valid?
      the_review.save
      flash[:notice] = 'Your Review Has Been Updated'
    else
      flash[:error] = the_review.errors.full_messages.to_sentence
    end

    redirect_back(fallback_location: home_path)
  end
end
