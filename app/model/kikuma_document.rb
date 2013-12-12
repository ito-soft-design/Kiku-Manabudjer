# -*- coding: utf-8 -*-
class KikumaDocument < NSDocument

  attr_reader :karuta

  attr_accessor :idLabel              # @type_info NSTextField
  attr_accessor :titleLabel           # @type_info NSTextField
  attr_accessor :linesLabel           # @type_info NSTextField
  attr_accessor :pairButton           # @type_info NSButton
  attr_accessor :firstLanguageLabel   # @type_info NSTextField
  attr_accessor :secondLanguageLabel  # @type_info NSTextField
  

  def init
    super
    @karuta = Karuta.new title:"Untitled"
    self
  end

  def windowNibName
    "Document"
  end
  
  def windowControllerDidLoadNib controller
    super
    set_title_of_labels
  end
  
  def autosavesInPlace
    true
  end
  
  def dataOfType typeName, error:outError
    karuta.to_json.nsdata
  end
  
  def readFromData data, ofType:typeName, error:outError
    @karuta = Karuta.new BW::JSON.parse(data)
  end

  private
  
  def set_title_of_labels
    titleLabel.stringValue = "Title:"._
    linesLabel.stringValue = "Lines:"._
    pairButton.title = "Pair"._
    firstLanguageLabel.stringValue = "First line:"._
    secondLanguageLabel.stringValue = "Second line:"._
  end


end
