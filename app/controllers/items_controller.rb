class ItemsController < ApplicationController
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

  def add
  end

  def remove
  end

  def edit
  end
end
