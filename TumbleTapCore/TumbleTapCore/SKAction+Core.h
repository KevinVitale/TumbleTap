//
//  SKAction+Core.h
//  TumbleTapCore
//
//  Created by Kevin Vitale on 11/24/13.
//
//

#import <SpriteKit/SpriteKit.h>

@interface SKAction (Core)
+ (instancetype)sequenceActions:(SKAction *)first, ...;
@end
