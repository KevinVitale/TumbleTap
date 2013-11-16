//
//  NSString+Core.h
//  TumbleTapCore
//
//  Created by Kevin Vitale on 11/16/13.
//
//

#import <Foundation/Foundation.h>

@class SKLabelNode;

@interface NSString (Core)
- (SKLabelNode *)labelNode;
- (SKLabelNode *)labelNode:(CGPoint)position;
@end
