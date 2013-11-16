//
//  AppDelegate.m
//  TumbleTap-OSX
//
//  Created by Kevin Vitale on 11/16/13.
//
//

#import "AppDelegate.h"
#import "TumbleTapCore/TumbleTapCore.h"

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

        TTCBaseScene *scene = [TTCBaseScene sceneWithSize:self.skView.frame.size];
        scene.scaleMode = SKSceneScaleModeResizeFill;
        
        TTCBaseScene *__weak weakScene = scene;
        scene.inputBeganCallback = ^(NSSet *touches, SKEvent *event) {
            TTCBaseScene *strongScene = weakScene;
            void (^nodeSetupBlock)(SKNode *) = ^(SKNode *node) {
                node.physicsBody.dynamic = YES;
                node.physicsBody.affectedByGravity = YES;
                node.physicsBody.velocity = CGVectorMake(0.f, 1000.f);
                [node runAction:[SKAction sequenceActions:
                                 [SKAction waitForDuration:2.5f],
                                 [SKAction fadeAlphaTo:0.f duration:.25f],
                                 [SKAction removeFromParent], nil]];
            };
            
#if TARGET_OS_IPHONE
            for(UITouch *touch in [[event allTouches] copy]) {
                CGPoint position = [touch locationInNode:strongScene];
                [strongScene addChild:[SKShapeNode triangleShapeNode:40.f position:position addPhysics:YES]
                           setupBlock:nodeSetupBlock];
            }
#else
            CGPoint position = (CGPoint)event.locationInWindow;
            SKShapeNode *triangle = [SKShapeNode triangleShapeNode:20.f position:position addPhysics:YES];
            [strongScene addChild:triangle
                       setupBlock:nodeSetupBlock];
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
