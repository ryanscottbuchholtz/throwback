class Admin::MemoriesController < Admin::AdminController
  before_action :set_memory, except: [:index]

  def index
    @memories = Memory.all
  end

  def destroy
    @memory.destroy
    redirect_to admin_memories_path
  end

private

def set_memory
  @memory = Memory.find(params[:id])
end
  
end