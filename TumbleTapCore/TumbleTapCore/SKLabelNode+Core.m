//
//  SKLabelNode+Core.m
//  TumbleTapCore
//
//  Created by Kevin Vitale on 11/16/13.
//
//

#import "SKLabelNode+Core.h"

@implementation SKLabelNode (Core)
+ (instancetype)labelNodeWithText:(NSString *)text position:(CGPoint)position {
    SKLabelNode *labelNode = [[self class] labelNodeWithFontNamed:@"Helvetica"];
    labelNode.text = text;
    labelNode.position = position;
    labelNode.fontSize = 14.f;
    
    return labelNode;
}

+ (instancetype)labelNodeWithText:(NSString *)text position:(CGPoint)position fontSize:(CGFloat)fontSize {
    SKLabelNode *labelNode = [[self class] labelNodeWithText:text position:position];
    labelNode.fontSize = fontSize;
    return labelNode;
}

+ (instancetype)labelNodeWithText:(NSString *)text position:(CGPoint)position fontSize:(CGFloat)fontSize fontNamed:(NSString *)fontName {
    SKLabelNode *labelNode = [[self class] labelNodeWithText:text position:position fontSize:fontSize];
    labelNode.fontName = fontName;
    return labelNode;
}
@end
