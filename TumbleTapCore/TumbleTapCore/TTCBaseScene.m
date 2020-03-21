//
//  TTCBaseScene.m
//  TumbleTapCore
//
//  Created by Kevin Vitale on 11/16/13.
//
//

#import "TTCBaseScene.h"

#pragma mark - Base Scene
@implementation TTCBaseScene
- (instancetype)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    if(self) {
    }
    return self;
}
@end

@implementation TTCBaseScene (Nodes)
- (void)addChild:(SKNode *)node setupBlock:(void (^)(SKNode *))block {
    if(block) {
        block(node);
    }
    [self addChild:node];
}
- (void)addChildren:(NSArray *)nodes setupBlock:(TTCNodeCallback)block {
    for(SKNode *node in nodes) {
        [self addChild:node setupBlock:block];
    }
}
@end

@implementation TTCBaseScene (Input)
#if TARGET_OS_IPHONE
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if(self.inputBeganCallback) {
        self.inputBeganCallback(touches, event);
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if(self.inputDraggedCallback) {
        self.inputDraggedCallback(touches, event);
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if(self.inputEndedCallback) {
        self.inputEndedCallback(touches, event);
    }
}
#else
- (void)mouseDown:(NSEvent *)theEvent {
    if(self.inputBeganCallback) {
        self.inputBeganCallback(nil, theEvent);
    }
}
- (void)mouseDragged:(NSEvent *)theEvent {
    if(self.inputDraggedCallback) {
        self.inputDraggedCallback(nil, theEvent);
    }
}
- (void)mouseUp:(NSEvent *)theEvent {
    if(self.inputEndedCallback) {
        self.inputEndedCallback(nil, theEvent);
    }
}
#endif
@end

#pragma mark - Size Change
@implementation TTCBaseScene (SizeChange)
- (void)didChangeSize:(CGSize)oldSize {
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
}
@end
