class API < Grape::API
  prefix "api"
  default_format :json

  helpers AuthenticateHelper

  mount V1::Base

end