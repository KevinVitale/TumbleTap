//
//  NSNumber+Core.m
//  TumbleTapCore
//
//  Created by Kevin Vitale on 11/20/13.
//
//

#import "NSNumber+Core.h"
@import GameplayKit;

@implementation NSNumber (Core)
+ (NSNumber *)randomNumberWithMininumInteger:(NSInteger)minimumInteger maximumInteger:(NSInteger)maximumInteger {
    NSInteger integer = [[GKARC4RandomSource sharedRandom] nextIntWithUpperBound:maximumInteger] + minimumInteger;
    return [NSNumber numberWithInteger:integer];
}
@end
