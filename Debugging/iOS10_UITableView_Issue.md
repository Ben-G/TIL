- Cells were being uninstalled sometimes
- App would sometimes crash

-> Cause: observing content size changes with KVO and trigger UITableView update subsequently. Would throw off the cell install/uninstall cycle and sometimes just remove cells.

Easy fix: observe text instead

```swift
class RFIDebugCell: UITableViewCell {

    override func willMoveToSuperview(newSuperview: UIView?) {
        print("\(self) moving to \(newSuperview)")
    }

}
```

```swift
 [self listenTo:self.titleTextView keyPath:@keypath(_titleTextView.contentSize) selector:@selector(titleSizeChanged)];
```

```objc
- (void) titleSizeChanged
{
    NSString *charLimitedTitle = [self.titleTextView.text substringToIndex:MIN(self.titleTextView.text.length, MAX_CHARS_TITLE)];
    self.titleHeight = [self heightForText:charLimitedTitle inTextView:self.titleTextView];

    if (self.viewHasAppeared) {
        [self updateRowHeights:YES];
    }
}
```

View debugger: cell was gone

Added logging for view hierachy