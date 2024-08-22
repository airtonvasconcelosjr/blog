# frozen_string_literal: true

module Plataforms
  class PlataformController < ApplicationController
    include Authenticatable
    layout 'default'

    protected

    def after_sign_in_path_for(resource)
      stored_location_for(resource) || posts_path
    end

    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit :sign_in, keys: %i[email password]
    end

    private

    def user_not_authorized
      flash[:alert] = 'You are not authorized to perform this action.'

      render template: 'v1/unauthorized', layout: 'manager'
    end
  end
end
