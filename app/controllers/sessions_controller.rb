# encoding: UTF-8

class SessionsController < ApplicationController
  def show
    @company = Company.new
  end

  def new
    @company = Company.new
  end

  def create
    if company_params
      user = Company.find_or_create_with_form(company_params)
    else
      auth = request.env["omniauth.auth"]
      user = Common.find_or_create_with_omniauth(auth)
    end
    if user.present?
      session[:user_id] = user.id
      redirect_to root_url
    else
      failure
    end
  end

  def failure
    redirect_to root_url, flash: { :notice => "Inválido!" }
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Come back soon!'
  end

  private
    def company_params
      return nil unless params[:company].present?
      params.require(:company).permit(:name, :email, :password, :password_confirmation, :address, :number, :phone_number, :document_number)
    end
end
