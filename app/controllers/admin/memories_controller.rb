class Admin::MemoriesController < Admin::AdminController

  def index
    @memories = Memory.all
  end
  
end