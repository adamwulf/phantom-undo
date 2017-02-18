## NSUndoManager in invalid state

The core of the bug seems to be that the undo stack size is tracked separately from the undo stack itself. In rare cases, the undo stack can be entirely empty, even though the undo count is > 0.

## Repro steps

1. Launch the app, two text inputs will show
2. In the top text input, type anything
3. Notice the undo stack items appear in the text description at the bottom of the window
4. This adds an undo grouping, and an undo item to the stack
5. press escape
6. this will move focus to the 2nd text field, add another undo item, and will remove the undo item's added from step 2 (both items from the NSTextView and the NSTextStorage)
7. Notice the undo stack is replaced with the new undo item, and the count is updated
6. press escape again in the 2nd text field. (do not type anything, only press escape).
7. At the bottom of the window, the counter is still at 1, even though the undo stack is now empty



