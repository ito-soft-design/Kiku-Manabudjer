# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/osx'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

version = '1.0'
adhoc = ARGV[0] == "archive"

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Kiku Manabudjer'
  app.info_plist['LSHasLocalizedDisplayName'] = true

  app.identifier = 'com.itosoft.learn.by.hearing.manager'

  app.copyright = "Copyright (c) 2013 ITO SOFT DESIGN Inc. All Right Reserved."

  app.version = version
  app.info_plist['CFBundleShortVersionString'] = version

  app.icon = "AppIcon"

  app.info_plist['NSMainNibFile'] = 'MainMenu'

  app.deployment_target = "10.8"

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

  # CFBundleDocumentTypes
  document_types = [
    {
      "CFBundleTypeName" => "Kikuma file",
      "LSItemContentTypes" => [
        "com.itosoft.learn.by.hearing.file"
      ],
      "CFBundleTypeIconFile" => "FileIcon",
      "CFBundleTypeRole" => "Editor",
      "LSHandlerRank" => "Owner",
      "NSDocumentClass" => "KikumaDocument"
    }
  ]
  app.info_plist["CFBundleDocumentTypes"] = document_types

  # provisioning
  app.development do
    if adhoc
      app.codesign_certificate = "Mac Developer: Katsuyoshi Ito (FN4DNLCM76)"
    end
  end
  app.release do
    app.codesign_certificate = "3rd Party Mac Developer Application: ITO SOFT DESIGN Inc. (YNJ3TBTJUK)"
  end

  # Entitlements
  app.entitlements['com.apple.security.app-sandbox'] = true
  app.entitlements['com.apple.security.files.user-selected.read-write'] = true

end
