//
//  SKLabelNode+Core.h
//  TumbleTapCore
//
//  Created by Kevin Vitale on 11/16/13.
//
//

#import <SpriteKit/SpriteKit.h>

@interface SKLabelNode (Core)
+ (instancetype)labelNodeWithText:(NSString *)text position:(CGPoint)position;
+ (instancetype)labelNodeWithText:(NSString *)text position:(CGPoint)position fontSize:(CGFloat)fontSize;
+ (instancetype)labelNodeWithText:(NSString *)text position:(CGPoint)position fontSize:(CGFloat)fontSize fontNamed:(NSString *)fontName;
@end
