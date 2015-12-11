//
//  Queue.m
//  WordLadder
//
//  Created by Markus Feng on 12/3/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import "Queue.h"
#import "LinkedList.h"

@implementation Queue{
    LinkedList * list;
}

-(instancetype)init{
    self = [super init];
    if(self){
        list = [[LinkedList alloc] init];
    }
    return self;
}

-(void)enqueue:(NSObject *)obj{
    [list add:obj fromBeginning:true];
}

-(NSObject *)dequeue{
    if([self isEmpty]){
        return nil;
    }
    NSObject * last = [list lastObject];
    [list removeFromEnd];
    return last;
}

-(bool)isEmpty{
    return list.first == nil;
}

@end
