//
//  Graph.m
//  WordLadder
//
//  Created by Markus Feng on 12/3/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import "Graph.h"

@implementation Graph

-(instancetype)init{
    self = [super init];
    if(self) {
        self.dict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)addVertex:(NSString *)vertex{
    if(![self contains:vertex]){
        Vertex * v = [[Vertex alloc] initWithValue:vertex];
        [self.dict setObject:v forKey:vertex];
    }
}

-(void)addConnection:(NSString *)vertex1 with:(NSString*)vertex2{
    if(![self contains:vertex1]){
        [self addVertex:vertex1];
    }
    if(![self contains:vertex2]){
        [self addVertex:vertex2];
    }
    Vertex * v1 = [self.dict objectForKey:vertex1];
    Vertex * v2 = [self.dict objectForKey:vertex2];
    if(![v1.adjacent containsObject:v2]){
        [v1.adjacent addObject:v2];
    }
    if(![v2.adjacent containsObject:v1]){
        [v2.adjacent addObject:v1];
    }
}

-(bool)contains: (NSString *) vertex{
    return [self getVertex:vertex] != nil;
}

-(Vertex *)getVertex:(NSString *)vertex{
    return [self.dict objectForKey:vertex];
}


@end
