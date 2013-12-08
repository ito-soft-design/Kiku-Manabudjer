# -*- coding: utf-8 -*-
class Karuta

  attr_accessor :title
  attr_accessor :lines_text
  attr_accessor :for_language, :languages

  alias :linesText :lines_text
  alias :linesText= :lines_text
  alias :forLanguage :for_language
  alias :forLanguage= :for_language
  
  def initialize options={}
    @title = options[:title]
    @lines_text = options[:lines_text]
  end
  
  def to_h
    {
      title: title,
      lines_text: lines_text
    }
  end
  
  def to_json
    BW::JSON.generate to_h
  end
  
end
