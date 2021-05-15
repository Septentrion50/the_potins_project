class ApplicationController < ActionController::Base
  include SessionsHelper
  include LikesHelper
  include CityHelper

  add_flash_types :info, :error, :warning
end
