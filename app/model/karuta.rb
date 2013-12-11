# -*- coding: utf-8 -*-
class Karuta

  attr_accessor :uuid
  attr_accessor :title
  attr_accessor :lines_text
  attr_accessor :for_language, :languages
  
  attr_accessor :first_language, :second_language

  def initialize options={}
    @uuid = options[:uuid] || BubbleWrap.create_uuid
    @title = options[:title]
    @lines_text = options[:lines_text]
    @for_language = options[:for_language]
    @languages = options[:languages]
  end
  
  def to_h
    {
      uuid: uuid,
      title: title,
      
      lines_text: begin
        case lines_text
        when String
          lines_text
        else
          self.lines_text.string
        end
      end,
      
      for_language: for_language,
      languages: languages
    }
  end
  
  def languages
    @languages ||= [NSLocale.currentLocale.localeIdentifier.gsub("_", "-")]
  end
  
  def first_language
    self.languages[0] ? self.languages[0]._ : nil
  end
  
  def second_language
    self.languages[1] ? self.languages[1]._ : nil
  end
  
  def first_language= language
    self.languages[0] = begin
      key = nil
      self.available_languages_info.each do |k, v|
        if v == language
          key = k
          break
        end
      end
      key
    end
  end

  alias :setFirst_language :first_language=
  
  def second_language= language
    self.languages[1] = begin
      key = nil
      self.available_languages_info.each do |k, v|
        if v == language
          key = k
          break
        end
      end
      key
    end
  end

  alias :setSecond_language :second_language=
  
  def to_json
    BW::JSON.generate to_h
  end
  
  def available_languages_info
    @available_languages_info ||= {
      "ar-SA" => "ar-SA"._,
      "en-ZA" => "en-ZA"._,
      "th-TH" => "th-TH"._,
      "nl-BE" => "nl-BE"._,
      "en-AU" => "en-AU"._,
      "de-DE" => "de-DE"._,
      "en-US" => "en-US"._,
      "pt-BR" => "pt-BR"._,
      "pl-PL" => "pl-PL"._,
      "en-IE" => "en-IE"._,
      "el-GR" => "el-GR"._,
      "id-ID" => "id-ID"._,
      "sv-SE" => "sv-SE"._,
      "tr-TR" => "tr-TR"._,
      "pt-PT" => "pt-PT"._,
      "ja-JP" => "ja-JP"._,
      "ko-KR" => "ko-KR"._,
      "hu-HU" => "hu-HU"._,
      "cs-CZ" => "cs-CZ"._,
      "da-DK" => "da-DK"._,
      "es-MX" => "es-MX"._,
      "fr-CA" => "fr-CA"._,
      "nl-NL" => "nl-NL"._,
      "fi-FI" => "fi-FI"._,
      "es-ES" => "es-ES"._,
      "it-IT" => "it-IT"._,
      "ro-RO" => "ro-RO"._,
      "no-NO" => "no-NO"._,
      "zh-HK" => "zh-HK"._,
      "zh-TW" => "zh-TW"._,
      "sk-SK" => "sk-SK"._,
      "zh-CN" => "zh-CN"._,
      "ru-RU" => "ru-RU"._,
      "en-GB" => "en-GB"._,
      "fr-FR" => "fr-FR"._,
      "hi-IN" => "hi-IN"._
    }
  end

  def available_languages
    @@available_languages ||= begin
      self.available_languages_info.map do |k,v|
        v
      end.sort
    end
  end
  
end
