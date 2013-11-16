//
//  NSString+Core.m
//  TumbleTapCore
//
//  Created by Kevin Vitale on 11/16/13.
//
//

#import "NSString+Core.h"
#import "SKLabelNode+Core.h"

@implementation NSString (Core)
- (SKLabelNode *)labelNode {
    return [self labelNode:CGPointZero];
}
- (SKLabelNode *)labelNode:(CGPoint)position {
    return [SKLabelNode labelNodeWithText:self
                                 position:position
                                 fontSize:14.f
                                fontNamed:@"Arial"];
}
@end
