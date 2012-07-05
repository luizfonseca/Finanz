# coding: utf-8
require 'iconv'

class ImportsController < InheritedResources::Base
  load_and_authorize_resource
  skip_load_and_authorize_resource :only => [:create]
  before_filter :only => [:create] { params[:import][:file] = Iconv.conv('utf-8', 'iso-8859-1', params[:import][:file].read) }
  before_filter :only => [:create] { params[:import][:user_id] = current_user.id }

  def create
    create! do |success, failure|
      success.html { redirect_to transactions_path, :notice => "#{@import.transactions.count} novas transações" }
    end
  end
end
