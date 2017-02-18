//
//  AppDelegate.m
//  PhantomUndo
//
//  Created by Adam Wulf on 2/17/17.
//  Copyright © 2017 Flexibits Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "MMWindowController.h"

@interface AppDelegate ()<NSTextViewDelegate>

@property (strong, nonatomic) IBOutlet MMWindowController* windowController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [[self windowController] showWindow:nil];
}

- (MMWindowController *)windowController
{
    if (!_windowController) {
        _windowController = [[MMWindowController alloc] initWithWindowNibName:NSStringFromClass([MMWindowController class])];
    }
    
    return _windowController;
}

@end
