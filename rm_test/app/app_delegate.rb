class AppDelegate
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow

    issue_1_appkit
    issue_2_alert
  end

  def buildWindow
    @mainWindow = NSWindow.alloc.initWithContentRect([[240, 180], [480, 360]],
      styleMask: NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
      backing: NSBackingStoreBuffered,
      defer: false)
    @mainWindow.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
    @mainWindow.orderFrontRegardless
  end

  # the NSAppKitVersionNumber value returned is `577.0` (which is a way old number and incorrect)
  # while the XCode9 version returns `1561.0`
  def issue_1_appkit
    puts "== NSAppKitVersionNumber =="
    puts "NSAppKitVersionNumber: #{NSAppKitVersionNumber}"
    puts "NSAppKitVersionNumber10_12_2: #{NSAppKitVersionNumber10_12_2}"
    puts ""
  end

  # the constant return values from NSAler runModal should be
  # NSAlertFirstButtonReturn, NSAlertSecondButtonReturn, and NSAlertThirdButtonReturn
  # but these constants do not compile
  def issue_2_alert
    puts "== NSAlert =="
    alert                 = NSAlert.alloc.init
    alert.messageText     = "Warning"
    alert.informativeText = "Informational message"
    alert.addButtonWithTitle('Cancel')
    alert.addButtonWithTitle('Move to Trash')
    alert.addButtonWithTitle('Show in Finder')
    alert.alertStyle = NSAlertStyleWarning
    return_code = alert.runModal

    puts "Alert return code: #{return_code}"
    # puts "Various Values Constants:"
    # puts "NSModalResponseOK: #{NSModalResponseOK}"
    # puts "NSModalResponseAbort: #{NSModalResponseAbort}"
    # puts "NSModalResponseCancel: #{NSModalResponseCancel}"
    # puts "NSModalResponseContinue: #{NSModalResponseContinue}"
    # puts "NSModalResponseStop: #{NSModalResponseStop}"

    case return_code
    # these all fail to compile
    when NSAlertFirstButtonReturn
      puts 'NSAlertFirstButtonReturn'
    when NSAlertSecondButtonReturn
      puts 'NSAlertSecondButtonReturn'
    when NSAlertThirdButtonReturn
      puts 'NSAlertThirdButtonReturn'

    else
      puts "NOT HANDLED"
    end
  end
end
