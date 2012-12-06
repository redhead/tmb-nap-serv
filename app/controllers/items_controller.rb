class ItemsController < ApplicationController

  def add
    @item = Item.new(params[:item])
    @item.user = User.find(params[:user_id])

    respond_to do |format|
      begin         
        @item.save!
        format.json { render :json => { :response => "Item saved!", :status => "OK", :item => @item } }
      rescue ActiveRecord::RecordInvalid => e
        puts e.message
        format.json { render :json => { :response => e.message, :status => "NOT OK"} }
      end
    end
  end

  def remove
    @item = Item.find(params[:id])
    @user = User.find(params[:user_id])
    
    respond_to do |format|
      if @item.user == @user
          @item.destroy
          if @item.destroyed?
            format.json { render :json => { :response => "Item deleted!", :status => "OK" } }
          else
            format.json { render :json => { :response => "Could not delete item!", :status => "NOT OK" } }
          end
      else
        format.json { render :json => { :response => "Invalid user, item not deleted!", :status => "NOT OK" } }
      end
    end
  end

  def edit
    @item = Item.find(params[:id])
    @user = User.find(params[:user_id])

    respond_to do |format|
      if @item.user == @user
        begin         
          @item.assign_attributes(params[:item])
          @item.save!
          format.json { render :json => { :response => "Item updated!", :status => "OK"} }
        rescue ActiveRecord::RecordInvalid => e
          puts e.message
          format.json { render :json => { :response => e.message, :status => "NOT OK"} }
        end
      else
        format.json { render :json => { :response => "Invalid user, item not updated!", :status => "NOT OK"} }
      end
    end
  end

  def find
    @items = Item.find(params[:item])
    respond_to do |format|
        format.json { render :json => { :items => @items } }
    end
  end

  def get
    @item = Item.find(params[:id])
    respond_to do |format|
        format.json { render :json => @item }
    end
  end

  def get_all_by_user
    @item = Item.find_by_user_id(params[:id])
    respond_to do |format|
        format.json { render :json => @item }
    end
  end
end
