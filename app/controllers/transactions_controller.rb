class TransactionsController < InheritedResources::Base
  load_and_authorize_resource
  before_filter :only => [:index] { @import = Import.new }
end
