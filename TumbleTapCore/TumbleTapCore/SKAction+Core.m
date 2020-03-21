//
//  SKAction+Core.m
//  TumbleTapCore
//
//  Created by Kevin Vitale on 11/24/13.
//
//

#import "SKAction+Core.h"

@implementation SKAction (Core)
+ (instancetype)sequencedActions:(SKAction *)first, ... {
    va_list args;
    va_start(args, first);
    
    NSMutableArray *array = [@[] mutableCopy];
    
    SKAction *action = first;
    while(action) {
        [array addObject:action];
        action = va_arg(args, SKAction *);
    }
    
    return [SKAction sequence:[array copy]];
}
@end
