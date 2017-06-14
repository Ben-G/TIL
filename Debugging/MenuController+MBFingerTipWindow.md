- Noticed that `UIMenuController` would stop showing up when using `MBFingerTipWindow` in the app

- When inspecting view hierarchy, noticed that in that case our app window was no longer the key window; instead it was `MBFingerTipOverlayWindow`

- Found [here]([http://supereasyapps.com/blog/2014/4/17/show-the-uimenucontroller-and-display-custom-edit-menus-for-uiviewcontroller-uitableviewcontroller-and-uicollectionview-on-ios-7](http://supereasyapps.com/blog/2014/4/17/show-the-uimenucontroller-and-display-custom-edit-menus-for-uiviewcontroller-uitableviewcontroller-and-uicollectionview-on-ios-7)) that `UIMenuController` can only be presented in the key window:

  - > The UIMenuController can only be displayed on the key window. There are times where you might use someone else's library or framework to display a full-screen advertisement or maybe a mobile printing solution like Sincerely Ship. In these cases I have run into issues where the third-party code has changed key windows, by adding their own UIWindow and didn't reset the key window. This will result in UIMenuController not working, so you can fix it by using this line of code when your viewDidAppear: is called.

- Set symbolic breakpoint in `[UIWindow makeKeyAndVisible]` and `[UIWindow makeKeyWindow]`

- Noticed: 

  - UIAlert was being presented in separate window

  - When window was hidden; `[UIWindow _setHidden: forced:]` was called 

  - Inspected receiver: who was being called? 

    - ```C
      po $x0
      <MBFingerTipOverlayWindow: 0x109c3c1c0; baseClass = UIWindow; frame = (0 0; 1024 768); userInteractionEnabled = NO; gestureRecognizers = <NSArray: 0x170454640>; layer = <UIWindowLayer: 0x1742380e0>>
      ```

    - Register 0 is the receiver of message in Objective-C

  - Noticed that this call is initiated from `_FindNewKeyWindowIgnoringWindow`

    - That in turn calls `_topMostVisibleWindowPassingTest`

