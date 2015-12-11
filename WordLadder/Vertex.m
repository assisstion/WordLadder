//
//  Vertex.m
//  WordLadder
//
//  Created by Markus Feng on 12/3/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex

-(instancetype)initWithValue:(NSString *)value{
    self = [super init];
    if(self){
        self.value = value;
        self.adjacent = [[NSMutableArray alloc] init];
        self.color = @"white";
    }
    return self;
}

-(NSString*)description{
    return [NSString stringWithFormat:@"%@", [self.adjacent objectAtIndex:0].value];
}

@end
