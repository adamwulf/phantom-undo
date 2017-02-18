//
//  MMWindowController.m
//  PhantomUndo
//
//  Created by Adam Wulf on 2/17/17.
//  Copyright © 2017 Flexibits Inc. All rights reserved.
//

#import "MMWindowController.h"
#import "FBUndoManager.h"
#import "NSUndoManager+FBUndoStack.h"

@interface MMWindowController ()

@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextView *textView;
@property (weak) IBOutlet NSTextField *lbl;

@property (nonatomic, strong) FBUndoManager *undoManager;

@end

@implementation MMWindowController

-(void) windowDidLoad{
    [super windowDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidEndEditing:) name:NSTextDidEndEditingNotification object:_textView];
}

-(void) showWindow:(id)sender{
    [super showWindow:sender];
    
    [self updateUndoStackCountLabel];
    
    [_textView becomeFirstResponder];
}

- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window
{
    if (!_undoManager) {
        // our custom undo manager just adds logging to the undo
        // manager's methods so we can see a bit of what's going on.
        _undoManager = [[FBUndoManager alloc] init];
    }
    
    return _undoManager;
}

-(void) updateUndoStackCountLabel{
    _lbl.stringValue = [NSString stringWithFormat:@"Undo Stack Count: %d\n\nUndo Stack Description:\n%@", (int) [[[_textView undoManager] fb_undoStack] count], [[_textView undoManager] fb_undoStack]];
}

#pragma mark - NSTextFieldDelegate

- (BOOL)control:(NSControl *)control textView:(NSTextView *)textView doCommandBySelector:(SEL)commandSelector{
    if (commandSelector == @selector(cancelOperation:)) {
        [[_textView undoManager] removeAllActionsWithTarget:self];
        [self updateUndoStackCountLabel];
        [self performSelector:@selector(updateUndoStackCountLabel) withObject:nil afterDelay:.3];
    }
    
    return YES;
}

#pragma mark - NSTextViewDelegate

- (BOOL)textView:(NSTextView *)textView doCommandBySelector:(SEL)commandSelector
{
    if (commandSelector == @selector(cancelOperation:)) {
        
        [[_textView undoManager] registerUndoWithTarget:self handler:^(id  _Nonnull target) {
            NSLog(@"--undo--");
        }];
        
        [[textView window] endEditingFor:nil];
        [_textField becomeFirstResponder];
        [self updateUndoStackCountLabel];
        [self performSelector:@selector(updateUndoStackCountLabel) withObject:nil afterDelay:.3];
        return YES;
    }
    
    return NO;
}

-(void)textDidEndEditing:(NSNotification*)notification{
    if([notification object] == _textView){
        [[_textView undoManager] removeAllActionsWithTarget:_textView];
        [[_textView undoManager] removeAllActionsWithTarget:[_textView textStorage]];
    }
    [self updateUndoStackCountLabel];
    [self performSelector:@selector(updateUndoStackCountLabel) withObject:nil afterDelay:.3];
}

@end
