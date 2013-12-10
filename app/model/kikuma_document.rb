# -*- coding: utf-8 -*-
class KikumaDocument < NSDocument

  attr_reader :karuta

  def initialize
    @karuta = Karuta.new title:"Untitled"
  end

  def windowNibName
p "KikumaDocument#windowNibName"
    "Document"
  end
  
  def windowControllerDidLoadNib controller
    super
  end
  
  def autosavesInPlace
    true
  end
  
  def dataOfType typeName, error:outError

p typeName

    karuta.to_json.nsdata
    
  end
  
  def readFromData data, ofType:typeName, error:outError

p typeName

    @karuta = Karuta.new BW::JSON.parse(data)
p @karuta
    @karuta
  end
  
end
