//
//  NSUndoManager+FBUndoStack.m
//  PhantomUndo
//
//  Created by Adam Wulf on 1/20/17.
//  Copyright © 2017 Flexibits Inc. All rights reserved.
//

#import "NSUndoManager+FBUndoStack.h"
#import <objc/runtime.h>

@implementation NSUndoManager (FBUndoStack)

#ifdef DEBUG

// from http://parmanoir.com/Inspecting_NSUndoManager%27s_undo_stack

- (NSArray *)fb_undoStack
{
    id v1;
    object_getInstanceVariable(self, "_undoStack", (void **)&v1);
    return [[v1 retain] autorelease];
}


- (NSArray *)fb_redoStack
{
    id v2;
    object_getInstanceVariable(self, "_redoStack", (void **)&v2);
    return [[v2 retain] autorelease];
}

#endif

@end
