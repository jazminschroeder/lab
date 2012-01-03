class AuthorizeNetReportsController < ApplicationController
  require 'authorize_net_reporting'
  
  def index
    if params[:commit]
      report = AuthorizeNetReporting::Report.new({ :mode => "test", :login=>"3vk59E5BgM", :key => "9Z6H2PybfGEp884J" })
      @transactions = report.settled_batch_list({:first_settlement_date => "2011/04/20", :last_settlement_date => "2011/05/20"})
     
    end  
  end
  
  def create
    
  end

end
