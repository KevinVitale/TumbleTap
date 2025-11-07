//
//  MyScene.m
//  TumbleTap
//
//  Created by Kevin Vitale on 3/20/20.
//

#import "MyScene.h"

@interface MyScene ()
@property (nonatomic, nullable, copy) SKEvent* event;
@end


@implementation MyScene
- (void)update:(NSTimeInterval)currentTime {
  [super update:currentTime];
  if (self.event) {
#if TARGET_OS_IPHONE
#else
    [super mouseDown:self.event];
#endif
  }
}

#if TARGET_OS_IPHONE
#else
- (void)mouseDown:(NSEvent *)event {
  self.event = event;
}

- (void)mouseDragged:(NSEvent *)event {
  self.event = event;
}

- (void)mouseUp:(NSEvent *)event {
  [super mouseUp:event];
  self.event = nil;
}
#endif

@end
