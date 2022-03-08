require 'bcrypt'

class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  include BCrypt

  # GET /users/new
  def new
    # @user = User.new
  end

  # POST /users/login
  def sign_in
    email = params.fetch('email')
    password = params.fetch('password')

    user_from_db = User.where({ email: email }).first
    is_password_match = Password.new(user_from_db.password) == password
    # TODO: handle unmatch credntial
  end

  # GET /users/login
  def login; end

  # POST /users
  def create
    @user = User.new
    @user.first_name = params.fetch('first_name')
    @user.last_name = params.fetch('last_name')
    @user.email = params.fetch('email')
    @user.password = Password.create(params.fetch('password'))

    if @user.valid?
      @user.save
      redirect_to(courses_path)
    else
      p(123_123)
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      # format.html { render(:new, status: :unprocessable_entity) }
      # format.json { render(json: @user.errors, status: :unprocessable_entity) }
      # render(action: :create, alert: @user.errors.full_messages.to_sentence)
      # format.html { alert: @user.errors.full_messages.to_sentence }
      # redirect_to(:back, { alert: @user.errors.full_messages.to_sentence })
    end
    # rescue StandardError => e
    #   p('error while creating user')
    #   p(e)
    #   redirect_to(users_new_path, { alert: 'Unable to create user' })

    # respond_to do |format|
    #   if @course.save
    #     format.html { redirect_to(course_url(@user), notice: 'User was successfully created.') }
    #     format.json { render(:show, status: :created, location: @user) }
    #   else
    #     format.html { render(:new, status: :unprocessable_entity) }
    #     format.json { render(json: @course.errors, status: :unprocessable_entity) }
    #   end
  end
end
