//
//  NSNumber+Core.m
//  TumbleTapCore
//
//  Created by Kevin Vitale on 11/20/13.
//
//

#import "NSNumber+Core.h"

@implementation NSNumber (Core)
+ (NSNumber *)randomNumberWithMininumInteger:(NSInteger)minimumInteger maximumInteger:(NSInteger)maximumInteger {
    return [NSNumber numberWithInteger:(minimumInteger + arc4random() % (maximumInteger - minimumInteger))];
}
@end
