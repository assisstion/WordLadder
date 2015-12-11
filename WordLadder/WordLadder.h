//
//  WordLadder.h
//  WordLadder
//
//  Created by Markus Feng on 12/4/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Graph.h"

@interface WordLadder : NSObject

@property Graph * graph;

-(void)generateGraphFromFile:(NSString *)path withWordLength:(int)len;
-(NSArray<NSString *> *)solveFromWord:(NSString *)word1 toWord:(NSString *)word2;

@end
