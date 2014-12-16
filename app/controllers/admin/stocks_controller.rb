class Admin::StocksController < ApplicationController
   before_filter :authenticate_admin!

  def addtostock

  end
end