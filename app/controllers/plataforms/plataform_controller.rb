# frozen_string_literal: true

module Plataforms
  class PlataformController < ApplicationController
    layout 'default'

    protected

    def after_sign_in_path_for(resource)
      stored_location_for(resource) || posts_path
    end

    private

    def user_not_authorized
      flash[:alert] = 'You are not authorized to perform this action.'

      render template: 'v1/unauthorized', layout: 'manager'
    end
  end
end
