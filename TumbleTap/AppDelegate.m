//
//  AppDelegate.m
//  TumbleTap-OSX
//
//  Created by Kevin Vitale on 11/16/13.
//
//

#import "AppDelegate.h"
#import "MyScene.h"

@implementation AppDelegate
#if TARGET_OS_IPHONE
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.skView = (SKView *)self.window.rootViewController.view;
#else
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
#endif
    
    if(self.skView) {
        self.skView.showsFPS = YES;
        self.skView.showsNodeCount = YES;
        self.skView.showsDrawCount = YES;

        TTCBaseScene *scene = [MyScene sceneWithSize:self.skView.frame.size];
        scene.scaleMode = SKSceneScaleModeResizeFill;

        TTCBaseScene *__weak weakScene = scene;
        scene.inputBeganCallback = ^(NSSet *touches, SKEvent *event) {
            TTCBaseScene *strongScene = weakScene;
            void (^nodeSetupBlock)(SKNode *) = ^(SKNode *node) {
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                    ((SKShapeNode*)node).strokeColor = [SKColor colorWithRed:([NSNumber randomNumberWithMininumInteger:0 maximumInteger:255].floatValue / 255.f)
                                                                       green:([NSNumber randomNumberWithMininumInteger:0 maximumInteger:255].floatValue / 255.f)
                                                                        blue:([NSNumber randomNumberWithMininumInteger:0 maximumInteger:255].floatValue / 255.f)
                                                                       alpha:1.0f];
                    
                    node.physicsBody.dynamic = YES;
                    node.physicsBody.affectedByGravity = YES;
                    node.physicsBody.velocity = CGVectorMake(0.f, 1000.f);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [node runAction:[SKAction sequencedActions:
                                         [SKAction waitForDuration:2.5f],
                                         [SKAction fadeAlphaTo:0.f duration:.25f],
                                         [SKAction removeFromParent], nil]];
                    });
                });
            };
            
#if TARGET_OS_IPHONE
            for(UITouch *touch in [[event allTouches] copy]) {
                CGPoint position = [touch locationInNode:strongScene];
                [strongScene addChild:[SKShapeNode triangleShapeNode:40.f position:position addPhysics:YES]
                           setupBlock:nodeSetupBlock];
            }
#else
             CGFloat size = 20.f; // <--: Set this size!

            //------------------------------------------------------------------
            CGPoint position = (CGPoint)event.locationInWindow;
            NSNumber *circleOrTriangle = [NSNumber randomNumberWithMininumInteger:0 maximumInteger:100];
            //------------------------------------------------------------------
            if (circleOrTriangle.integerValue <= 50) {
                SKShapeNode *circle = [SKShapeNode circularShape:size * 0.3f position:position addPhysics:YES];
                [strongScene addChild:circle.copy setupBlock:nodeSetupBlock];
                [strongScene addChild:circle.copy setupBlock:nodeSetupBlock];
            } else {
                SKShapeNode *triangle = [SKShapeNode triangleShapeNode:size position:position addPhysics:YES];
                [strongScene addChild:triangle.copy setupBlock:nodeSetupBlock];
                [strongScene addChild:triangle.copy setupBlock:nodeSetupBlock];
            }
            //------------------------------------------------------------------
#endif
            
        };
        scene.inputDraggedCallback = scene.inputBeganCallback;

        [self.skView presentScene:scene];
    }
    
#if TARGET_OS_IPHONE
    [self.window makeKeyAndVisible];
    return YES;
#endif
}

@end
