//
//  AppDelegate.m
//  xcode_test
//
//  Created by Brett Walker on 10/31/17.
//  Copyright © 2017 digitalMoksha. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
  - (void)issue_2_alert;
  @property (weak) IBOutlet NSWindow *window;
@end


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  // Insert code here to initialize your application
  
  [self issue_1_appkit];
  [self issue_2_alert];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}

- (void)issue_1_appkit {
  NSLog(@"== NSAppKitVersionNumber ==");
  NSLog(@"NSAppKitVersionNumber: %f", NSAppKitVersionNumber);
  NSLog(@"NSAppKitVersionNumber10_12_2: %f", NSAppKitVersionNumber10_12_2);
}

- (void)issue_2_alert {
  NSAlert *alert;
  NSModalResponse return_code;
  
  NSLog(@"== NSAlert ==");
  alert                 = [[NSAlert alloc] init];
  alert.messageText     = @"Warning";
  alert.informativeText = @"Informational message";
  [alert addButtonWithTitle:@"Cancel"];
  [alert addButtonWithTitle:@"Move to Trash"];
  [alert addButtonWithTitle:@"Show in Finder"];
  alert.alertStyle = NSAlertStyleWarning;
  return_code = alert.runModal;
  NSLog(@"Alert return code: %ld", return_code);
  
  switch (return_code)
  {
    case NSAlertFirstButtonReturn:
      NSLog(@"NSAlertFirstButtonReturn: %ld", NSAlertFirstButtonReturn);
      break;
    case NSAlertSecondButtonReturn:
      NSLog(@"NSAlertSecondButtonReturn: %ld", NSAlertSecondButtonReturn);
      break;
    case NSAlertThirdButtonReturn:
      NSLog(@"NSAlertThirdButtonReturn: %ld", NSAlertThirdButtonReturn);
      break;
    default:
      NSLog(@"NOT HANDLED: %ld", return_code);
      break;
  }
}


@end
