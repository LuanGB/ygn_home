class Api::V1::NewsletterSubscriptionController < ApplicationController
  def create
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to subscription_url(@subscription), notice: "Subscription was successfully created." }
        format.json { render json: @subscription.as_json, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email)
  end
end
