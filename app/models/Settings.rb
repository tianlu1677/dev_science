class Settings < Settingslogic
  source "#{Rails.root}/config/settings.yml"
  namespace Rails.env
  load! unless Rails.env.production?
end