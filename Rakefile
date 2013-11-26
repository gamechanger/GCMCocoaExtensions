
task :test do |t|
  sh "killall \"iPhone Simulator\" || true"
  sh "xctool -workspace GCMCocoaExtensions.xcworkspace ONLY_ACTIVE_ARCH=NO ARCHS=i386 -scheme GCMCocoaExtensions -sdk iphonesimulator clean build"
  sh "xcodebuild test -workspace GCMCocoaExtensions.xcworkspace -scheme GCMCocoaExtensions -destination OS=6.1,name=iPhone"
  sh "xctool -workspace GCMCocoaExtensions.xcworkspace -scheme GCMCocoaExtensions analyze -failOnWarnings"
end
