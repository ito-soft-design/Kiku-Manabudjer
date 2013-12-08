class AppDelegate

  attr_accessor :window             # @type_info NSWindow
  attr_accessor :objectController   # @type_info NSObjectController
  attr_accessor :karuta
  
  attr_accessor :store_path, :store_url
  
  def applicationDidFinishLaunching(notification)
#    buildMenu
    buildWindow
    create self
  end

  def buildWindow
  end
  
  def create sender
    @karuta = Karuta.new title:"Untitled", lines_text:""
    objectController.content = @karuta
  end
  
  def open sender
    panel = NSOpenPanel.openPanel
    panel.setAllowedFileTypes ["kikuma"]
    case panel.runModal
    when NSFileHandlingPanelOKButton
      #self.store_path = panel.filename
      self.store_url = panel.URL
      #data = self.store_path.fileurl.nsdata # NSData.dataWithContentsOfFile store_path
      data = self.store_url.nsdata # NSData.dataWithContentsOfFile store_path
      @karuta = Karuta.new BW::JSON.parse(data)
      objectController.content = @karuta
    end
    
  end
  
  def save sender
    if store_url
      karuta.to_json.nsdata.write_to store_url
    else
      saveAs sender
    end
  end
  
  def saveAs sender
    panel = NSSavePanel.savePanel
    panel.setAllowedFileTypes ["kikuma"]
    panel.URL = self.store_url if self.store_url
    case panel.runModal
    when NSFileHandlingPanelOKButton
      store_url = panel.URL
      karuta.to_json.nsdata.write_to store_url
    end
  end
  
end
