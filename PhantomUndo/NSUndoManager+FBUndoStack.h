//
//  NSUndoManager+FBUndoStack.h
//  PhantomUndo
//
//  Created by Adam Wulf on 1/20/17.
//  Copyright © 2017 Flexibits Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUndoManager (FBUndoStack)

#ifdef DEBUG

- (NSArray *)fb_undoStack;
- (NSArray *)fb_redoStack;

#endif

@end
