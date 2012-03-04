class AuthorizeNetReportsController < ApplicationController
  before_filter :authorize_net_report
  
  def index
    @batches = authorize_net_report.settled_batch_list({:first_settlement_date => "2011/04/20", :last_settlement_date => "2011/05/20"}) if params[:commit]
  end
  
  def batch_transactions
    @batch = authorize_net_report.batch_statistics(params[:batch_id])
    @transactions = authorize_net_report.transaction_list(params[:batch_id])
  end
  
  
  def transaction_details
    @transaction = authorize_net_report.transaction_details(params[:id])
  end
  
  
  private
  def authorize_net_report
    if @report.blank?
       config = YAML.load_file("#{Rails.root}/config/authorize_net.yml")["development"]
       report = AuthorizeNetReporting::Report.new({ mode: "test", login: config["login"], key: config["key"] })
    end
    @report     
  end
end
