//
//  SKShapeNode+Core.h
//  TumbleTapCore
//
//  Created by Kevin Vitale on 11/17/13.
//
//

#import <SpriteKit/SpriteKit.h>

@interface SKShapeNode (Core)
+ (instancetype)triangleShapeNode;
+ (instancetype)triangleShapeNode:(CGFloat)height
                         position:(CGPoint)position
                       addPhysics:(BOOL)physics;

+ (instancetype)circularShape;
+ (instancetype)circularShape:(CGFloat)radius position:(CGPoint)position addPhysics:(BOOL)physics;
@end
