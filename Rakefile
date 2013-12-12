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


  # CFBundleDocumentTypes
  app.info_plist["CFBundleDocumentTypes"] = [
    {
      "CFBundleTypeExtensions" => ["kikuma"],
      "CFBundleTypeIconFile" => "FileIcon",
      "CFBundleTypeMIMETypes" => ["application/json"],
      "CFBundleTypeName" => "Kiku Manabu Document",
      "CFBundleTypeOSTypes" => ["????"],
      "CFBundleTypeRole" => "Editor",
      "LSItemContentTypes" => ["com.itosoft.learn.by.hearing.file"],
      "NSDocumentClass" => "KikumaDocument"
    }
  ]

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
