//
//  MyScene.m
//  TumbleTap
//
//  Created by Kevin Vitale on 3/20/20.
//

#import "MyScene.h"

@interface MyScene ()
@property (nonatomic, nullable, copy) NSEvent* event;
@end


@implementation MyScene
- (void)update:(NSTimeInterval)currentTime {
    [super update:currentTime];
    if (self.event) {
        [super mouseDown:self.event];
    }
}

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

@end

