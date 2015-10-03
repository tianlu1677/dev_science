module V1
  class Base < Grape::API
    version "v1", :using => :path
    default_format :json

    include Grape::Kaminari

    helpers AuthenticateHelper

    mount V1::Group

  end
end