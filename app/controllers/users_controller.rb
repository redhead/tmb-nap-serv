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
  	#respond_to do |format|
  	#	format.json { render :json => params[:user]}
  	#end
  	respond_to do |format|
      begin 
      	@user.save!
      rescue ActiveRecord::RecordInvalid => e
      	if e.message == 'Validation failed: Username has already been taken'
    		format.json { render :json => { :response => "False"} }
  		else
    		format.html { render :json => { :response => "True"} }
  		end
      end
    end
  end


end
