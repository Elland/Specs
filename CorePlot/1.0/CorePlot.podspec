Pod::Spec.new do |s|
  s.name     = 'CorePlot'
  s.version  = '1.0'
  s.license  = 'BSD'
  s.summary  = 'Cocoa plotting framework for Mac OS X and iOS.'
  s.homepage = 'http://code.google.com/p/core-plot/'
  s.authors  = { 'Drew McCormack' => 'drewmccormack@mac.com',
                 'Brad Larson'    => 'larson@sunsetlakesoftware.com',
                 'Eric Skroch'    => 'eskroch@mac.com',
                 'Barry Wark'     => 'barrywark@gmail.com' }
  s.source   = { :hg  => 'https://code.google.com/p/core-plot', :revision => 'release_1.0' }

  s.description = 'Core Plot is a plotting framework for OS X and iOS. It provides 2D visualization ' \
                  'of data, and is tightly integrated with Apple technologies like Core Animation, ' \
                  'Core Data, and Cocoa Bindings.'

  files = FileList['framework/TestResources/CorePlotProbes.d', 'framework/Source/*.{h,m}']
  files.exclude(/(TestCase|Tests)\.[hm]/)
  if config.ios?
    files.include('framework/CorePlot-CocoaTouch.h', 'framework/iPhoneOnly/*.{h,m}')
  else
    files.include('framework/CorePlot.h', 'framework/MacOnly/*.{h,m}')
  end
  s.source_files = files

  s.clean_paths = 'documentation', 'examples', 'scripts', 'QCPlugin', 'framework/*.{xcodeproj,lproj}'
  s.framework   = 'QuartzCore'
end
