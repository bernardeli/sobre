class InformationsController < InheritedResources::Base
  before_filter :authenticate_user!
  actions :update
end
