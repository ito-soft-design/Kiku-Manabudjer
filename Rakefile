# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/osx'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'kikumanager'
  app.info_plist['NSMainNibFile'] = 'MainMenu'


  # CFBundleDocumentTypes
  uti_declarations = [
    {
      "UTTypeIdentifier" => "com.itosoft.learn.by.hearing.file",
      "UTTypeDescription" => "Kikuma file",
      "UTTypeConformsTo" => [
        "public.data"
      ],
      "UTTypeTagSpecification" => {
        "public.mime-type" => "application/octet-stream",
        "public.filename-extension" => [
          "kikuma"
        ]
      }
    }
  ]
  app.info_plist["UTExportedTypeDeclarations"] = uti_declarations

  document_types = [
    {
      "CFBundleTypeName" => "Kikuma file",
      "LSItemContentTypes" => [
        "com.itosoft.learn.by.hearing.file"
      ],
      "CFBundleTypeRole" => "Editor",
      "LSHandlerRank" => "Owner",
      "NSDocumentClass" => "KikumaDocument"
    }
  ]
  app.info_plist["CFBundleDocumentTypes"] = document_types


end
