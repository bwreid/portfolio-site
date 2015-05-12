class HomeController < ApplicationController
  layout 'blank', only: [:portfolio]
  
  def index
  end

  def portfolio
    render "home/projects/#{params[:project_id]}.html"
  end

  def contact
    @valid = validate_contents(params[:contact])
    HomeMailer.contact_email(params[:contact]).deliver if @valid
    render :contact_response
  end

  private

  def validate_contents(contact_params)
    return false unless contact_params.values.select(&:blank?).empty?
    return false unless EmailValidator.valid? contact_params[:email]
    true
  end
end
