//
//  AppDelegate.h
//  TumbleTap-OSX
//
//  Created by Kevin Vitale on 11/16/13.
//
//


#if TARGET_OS_IPHONE
// IOS
@import UIKit;
@import SpriteKit.SKView;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, retain) IBOutlet UIWindow *window;

#else
// OS X
@import Cocoa;
@import SpriteKit.SKView;
@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (assign) IBOutlet NSWindow *window;
#endif

// SHARED
@property (assign) IBOutlet SKView *skView;
@end
