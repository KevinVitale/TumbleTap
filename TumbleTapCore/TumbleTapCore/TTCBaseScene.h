//
//  TTCBaseScene.h
//  TumbleTapCore
//
//  Created by Kevin Vitale on 11/16/13.
//
//

#import <SpriteKit/SpriteKit.h>

typedef void (^TTCNodeCallback)(SKNode *node);
#if TARGET_OS_IPHONE
typedef UIEvent SKEvent;
#else
typedef NSEvent SKEvent;
#endif
typedef void (^TTCInputCallback)(NSSet *, SKEvent *);

@interface TTCBaseScene : SKScene

@property (copy, nonatomic) TTCInputCallback inputBeganCallback;
@property (copy, nonatomic) TTCInputCallback inputDraggedCallback;
@property (copy, nonatomic) TTCInputCallback inputEndedCallback;
@end

@interface TTCBaseScene (Nodes)
/**
 Adds a node as a child node of this scene.
 
 The added node must not have a parent.
 
 @param node the child node to add.
 @param block a callback executed prior to adding the node to the scene graph.
 */
- (void)addChild:(SKNode *)node setupBlock:(TTCNodeCallback)block;

/**
 Adds multiple child nodes as children nodes of this scene.
 
 The added nodes must not have a parent.
 
 @params nodes the array of child nodes to add.
 @param block a callback executed, per-node, prior to adding the node to the scene graph.
 */
- (void)addChildren:(NSArray *)nodes setupBlock:(TTCNodeCallback)block;
@end
