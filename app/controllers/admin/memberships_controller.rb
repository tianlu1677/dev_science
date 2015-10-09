class Admin::MembershipsController < Admin::ApplicationController
  belongs_to :user, optional: true

  protected

  # def attributes
  #   %w(id  position status)
  # end
end
