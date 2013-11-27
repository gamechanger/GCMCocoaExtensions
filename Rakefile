
task :test do |t|
  sh "xctool -workspace GCMCocoaExtensions.xcworkspace ONLY_ACTIVE_ARCH=NO ARCHS=i386 -scheme GCMCocoaExtensions -sdk iphonesimulator clean build"
  sh "xctool -workspace GCMCocoaExtensions.xcworkspace -scheme GCMCocoaExtensions -sdk iphonesimulator test -freshSimulator -freshInstall"

  sh "xctool -workspace GCMCocoaExtensions.xcworkspace -scheme GCMCocoaExtensions analyze -failOnWarnings"
end
