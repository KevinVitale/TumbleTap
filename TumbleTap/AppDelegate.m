//
//  AppDelegate.m
//  TumbleTap-OSX
//
//  Created by Kevin Vitale on 11/16/13.
//
//

#import "AppDelegate+Private.h"

@implementation AppDelegate

#if TARGET_OS_IPHONE
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.skView = (SKView *)self.window.rootViewController.view;
  [self didFinishLaunching];
  [self.window makeKeyAndVisible];
  return YES;
#else
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  [self didFinishLaunching];
#endif
}

- (void)didFinishLaunching {
  SKView *skView = self.skView;
  if (!skView) { return; }
  
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
        SKColor *color = [SKColor colorWithRed:([NSNumber randomNumberWithMininumInteger:0 maximumInteger:255].floatValue / 255.f)
                                         green:([NSNumber randomNumberWithMininumInteger:0 maximumInteger:255].floatValue / 255.f)
                                          blue:([NSNumber randomNumberWithMininumInteger:0 maximumInteger:255].floatValue / 255.f)
                                         alpha:1.0f];
        
        ((SKShapeNode*)node).strokeColor = color;
        ((SKShapeNode*)node).fillColor = color;
        
        dispatch_async(dispatch_get_main_queue(), ^{
          node.physicsBody.dynamic = YES;
          node.physicsBody.affectedByGravity = YES;
          node.physicsBody.velocity = CGVectorMake(0.f, 1000.f);
          [node runAction:[SKAction sequencedActions:
                           [SKAction waitForDuration:2.5f],
                           [SKAction fadeAlphaTo:0.f duration:.25f],
                           [SKAction removeFromParent], nil]];
        });
      });
    };
    
    CGPoint position = strongScene.inputPosition;
    CGFloat size = 20.f; // <--: Set this size!
    
    NSNumber *circleOrTriangle = [NSNumber randomNumberWithMininumInteger:0 maximumInteger:100];
    if (circleOrTriangle.integerValue <= 50) {
      SKShapeNode *circle = [SKShapeNode circularShape:size * 0.3f position:position addPhysics:YES];
      [strongScene addChild:circle.copy setupBlock:nodeSetupBlock];
      [strongScene addChild:circle.copy setupBlock:nodeSetupBlock];
    } else {
      SKShapeNode *triangle = [SKShapeNode triangleShapeNode:size position:position addPhysics:YES];
      [strongScene addChild:triangle.copy setupBlock:nodeSetupBlock];
      [strongScene addChild:triangle.copy setupBlock:nodeSetupBlock];
    }
  };
      
    scene.inputDraggedCallback = scene.inputBeganCallback;
    [self.skView presentScene:scene];
}
  
@end
