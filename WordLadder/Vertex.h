//
//  Vertex.h
//  WordLadder
//
//  Created by Markus Feng on 12/3/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vertex : NSObject

@property NSString * value;
@property NSMutableArray<Vertex *> * adjacent;

@property NSString * color;
@property Vertex * predecessor;
@property int distance;

-(instancetype)initWithValue:(NSString *)value;

@end
