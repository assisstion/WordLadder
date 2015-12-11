//
//  Queue.h
//  WordLadder
//
//  Created by Markus Feng on 12/3/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject

-(void)enqueue:(NSObject *)obj;
-(NSObject *)dequeue;
-(bool)isEmpty;

@end
