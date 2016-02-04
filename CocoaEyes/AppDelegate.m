//
//  AppDelegate.m
//  CocoaEyes
//
//  Created by Jason Kasper on 2/3/16.
//  Copyright © 2016 Jason Kasper. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (readwrite, retain, nonatomic) id eventHandler;

@end

@implementation AppDelegate

@synthesize eventHandler;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    // XXX Apparently this doesn't work when the CocoaEyes application is active?
    // Also doesn't work in Mission Control view.
    eventHandler = [NSEvent addGlobalMonitorForEventsMatchingMask:NSMouseMovedMask handler:^(NSEvent * mouseEvent) {
        NSLog(@"Mouse moved: %@", NSStringFromPoint([mouseEvent locationInWindow]));
    }];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    [NSEvent removeMonitor:eventHandler];
}

@end
