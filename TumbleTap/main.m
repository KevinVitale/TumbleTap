//
//  main.m
//  TumbleTap-OSX
//
//  Created by Kevin Vitale on 11/16/13.
//
//

#if TARGET_OS_IPHONE
@import UIKit;
#import "AppDelegate.h"
#else
@import Cocoa;
#endif

#if TARGET_OS_IPHONE
int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
#else
int main(int argc, const char * argv[]) {
    return NSApplicationMain(argc, argv);
#endif
}
