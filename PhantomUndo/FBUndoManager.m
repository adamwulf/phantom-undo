//
//  FBUndoManager.m
//  PhantomUndo
//
//  Created by Adam Wulf on 9/30/16.
//  Copyright © 2017 Flexibits Inc. All rights reserved.
//

#import "FBUndoManager.h"

@implementation FBUndoManager


- (void)registerUndoWithTarget:(id)target handler:(void (^)(id _Nonnull))undoHandler
{
    [super registerUndoWithTarget:target handler:undoHandler];

    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)registerUndoWithTarget:(id)target selector:(SEL)selector object:(id)anObject
{
    [super registerUndoWithTarget:target selector:selector object:anObject];

    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)removeAllActionsWithTarget:(id)target
{
    NSLog(@"%@", NSStringFromSelector(_cmd));

    [super removeAllActionsWithTarget:target];
}

- (void)removeAllActions
{
    NSLog(@"%@", NSStringFromSelector(_cmd));

    [super removeAllActions];
}

- (void)undo
{
    NSLog(@"%@", NSStringFromSelector(_cmd));

    [super undo];
}

- (void)redo
{
    NSLog(@"%@", NSStringFromSelector(_cmd));

    [super redo];
}

- (void)beginUndoGrouping
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    [super beginUndoGrouping];
}

- (void)endUndoGrouping
{
    [super endUndoGrouping];
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
