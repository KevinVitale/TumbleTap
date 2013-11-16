//
//  SKShapeNode+Core.m
//  TumbleTapCore
//
//  Created by Kevin Vitale on 11/17/13.
//
//

#import "SKShapeNode+Core.h"

@implementation SKShapeNode (Core)

+ (instancetype)triangleShapeNode {
    return [[self class] triangleShapeNode:15.f position:CGPointZero addPhysics:YES];
}

+ (instancetype)triangleShapeNode:(CGFloat)height position:(CGPoint)position addPhysics:(BOOL)physics {
    CGMutablePathRef path = CGPathCreateMutable();
    
    // Use:
    //  1.15470053837925f for circumsribing
    //  0.57735026918963 for inscribing
    CGFloat length = 0.57735026918963f * height;
    
    CGAffineTransform transform = CGAffineTransformMakeTranslation(-.5f * length, -0.28867513459481f * length);
    
    CGPathMoveToPoint(path, &transform, 0.f, .0f);
    CGPathAddLineToPoint(path, &transform, length, 0.f);
    CGPathAddLineToPoint(path, &transform, length * .5f, length * 0.86602540378444f);
    CGPathCloseSubpath(path);
    
    SKShapeNode *shape = [[self class] new];
    shape.path = path;
    shape.lineWidth = .1f;
    shape.antialiased = YES;
    shape.position = position;
    if(physics) {
        shape.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:path];
    }
    CGPathRelease(path);
    return shape;
}

+ (instancetype)circularShape {
    return [[self class] circularShape:10.f position:CGPointZero addPhysics:YES];
}
+ (instancetype)circularShape:(CGFloat)radius position:(CGPoint)position addPhysics:(BOOL)physics {
    SKShapeNode *shape = [[self class] new];
    CGRect shapeRect = CGRectMake(-(radius * .5f) + position.x, -(radius * .5f) + position.y, radius, radius);
    CGPathRef path = CGPathCreateWithEllipseInRect(shapeRect, NULL);
    shape.path = path;
    CGPathRelease(path);
    if(physics) {
        shape.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:radius];
    }
    return shape;
}
@end
