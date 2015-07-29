class AdminToolsController < ApplicationController
  before_action :authenticate_user!
end
