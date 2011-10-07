require 'rho/rhoapplication'
require 'date'

class AppApplication < Rho::RhoApplication
  def initialize
    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    # Super must be called *after* settings @tabs!
    @tabs = nil
    #To remove default toolbar uncomment next line:
    @@toolbar = nil
    super


    SyncEngine::set_objectnotify_url("/app/Settings/sync_object_notify")
    
    # we want to be notified whenever either of these sources is synced
    SyncEngine.set_notification(-1, "/app/Settings/sync_notify", "sync_complete=true")
    #SyncEngine.enable_status_popup(false)
    

    

      
  end
end
