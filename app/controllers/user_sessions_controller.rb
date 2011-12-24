class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        puts "logged in"
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
    render :json => { :success => true }
  end

  private

  def successful(session)
  	@current_user_session = session
    render :json => { :name => session.user.fl_name, :success => true }
  end

  def unsuccessful
    render :json => { :success => false }
  end
end
