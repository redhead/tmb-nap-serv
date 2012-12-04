class UsersController < ApplicationController
  def index
  	@users = User.all

  	respond_to do |format|
  		format.html
  		format.json { render :json => @users}
  	end
  end

  def register
  	@user = User.new(params[:user])  	
   	respond_to do |format|
      begin       	
      	@user.save!
      	format.json { render :json => { :response => "User registered", :status => "OK"} }
      rescue ActiveRecord::RecordInvalid => e
      	puts e.message
      	format.json { render :json => { :response => e.message, :status => "NOT OK"} }
      end
    end
  end

  def authenticate
  	@user = User.find_by_username(params[:user][:username])

  	respond_to do |format|
    	if @user and @user.password == params[:user][:password]
    		format.json { render :json => { :response => "User authenticated", :status => "OK"} }
    	else
    		format.json { render :json => { :response => "User not authenticated", :status => "NOT OK"} }
    	end
    end
  end


end
