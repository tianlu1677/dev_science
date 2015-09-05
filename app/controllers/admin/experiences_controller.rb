class Admin::ExperiencesController < Admin::ApplicationController
  belongs_to :user, optional: true


end
