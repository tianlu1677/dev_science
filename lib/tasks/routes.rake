# lib/tasks/routes.rake
## rake rake api:routes

namespace :api do
  desc "API Routes"
  task :routes => :environment do
    API.routes.each do |api|
      method = api.route_method
      path = api.route_path.gsub(":version", api.route_version)
      puts "     #{method} #{path}"
    end
  end
end