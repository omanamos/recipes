class UserSessionsController < ApplicationController
  skip_before_filter :require_login

  def new
    if logged_in?
      redirect_to "/users/#{current_user.id}"
    else
      @user_session = UserSession.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }
      end
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to "/users/#{@user_session.user.id}", notice: 'You\'re logged in.' }
        format.json { render json: @user_session, status: :created, location: @user_session }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    current_user_session.destroy if current_user_session
    respond_to do |format|
      format.html { redirect_to "/", notice: 'You\'ve logged out.' }
      format.json { render json: @user_session, status: :destroyed, location: @user_session }
    end
  end
end
