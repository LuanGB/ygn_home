# frozen_string_literal: true

module Api
  module V1
    class NewsletterSubscriptionController < ApplicationController
      def create
        @subscription = NewsletterSubscription.new(subscription_params)

        respond_to do |format|
          if @subscription.save
            format.html do
              redirect_to subscription_url(@subscription), notice: 'Subscription was successfully created.'
            end
            format.json { render json: @subscription.as_json, status: :created }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @subscription.errors, status: :unprocessable_entity }
          end
        end
      end

      private

      def subscription_params
        params.require(:newsletter_subscription).permit(:email)
      end
    end
  end
end
