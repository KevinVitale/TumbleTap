//
//  CoreTests.m
//  TumbleTapCore
//
//  Created by Kevin Vitale on 11/15/13.
//
//

@import XCTest;
@import SpriteKit;
#import <Availability.h>
#import "TumbleTapCore.h"
#import "Specta.h"

#define EXP_SHORTHAND
#import "Expecta.h"

SpecBegin(LabelNode)
describe(@"LabelNode", ^{
    SKLabelNode *__block _labelNode;
    NSString *_labelText = @"Hello, world";
    beforeAll(^ {
        _labelNode = [_labelText labelNode];
    });
    
    it(@"kind of", ^ {
        expect(_labelNode).to.beKindOf([SKLabelNode class]);
    });
    
    it(@"not be nil", ^ {
        expect(_labelNode).notTo.beNil();
    });
    
    it(@"match label text", ^ {
        expect(_labelNode.text).to.equal(_labelText);
    });
});
SpecEnd

SpecBegin(BaseScene)
describe(@"BaseScene", ^{
    TTCBaseScene *__block _baseScene;
    beforeAll(^ {
        _baseScene = [TTCBaseScene new];
    });
    
    it(@"kind of", ^ {
        expect(_baseScene).to.beKindOf([SKScene class]);
    });
    
    it(@"member of", ^ {
        expect(_baseScene).to.beMemberOf([TTCBaseScene class]);
    });
    
    it(@"not be nil", ^ {
        expect(_baseScene).toNot.beNil();
    });
    
});
SpecEnd

SpecBegin(RandomNumber)
describe(@"RandomNumber", ^{
    it(@"generates random integer", ^ {
        NSNumber *randomNumber = [NSNumber randomNumberWithMininumInteger:0 maximumInteger:100];
        expect(randomNumber.integerValue).to.beInTheRangeOf(0, 100);
    });
});
SpecEnd