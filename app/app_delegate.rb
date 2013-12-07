class AppDelegate

  attr_accessor :window             # @type_info NSWindow
  attr_accessor :objectController   # @type_info NSObjectController
  attr_accessor :karuta
  
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow
    @karuta = Karuta.new title:"title", lines_text:%w(a b c d e f).join("\n")
  end

  def buildWindow
  end
end
