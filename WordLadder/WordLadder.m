//
//  WordLadder.m
//  WordLadder
//
//  Created by Markus Feng on 12/4/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import "WordLadder.h"
#import "Queue.h"

@implementation WordLadder

-(void)generateGraphFromFile:(NSString *)path withWordLength:(int)len{
    
    NSArray<NSString *> * lines = [self getLinesFromFilePath:path];
    
    NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> * buckets = [self generateBuckets:lines withWordLength:len];
    
    self.graph = [self generateGraphFromBuckets:buckets];
    
}

-(NSArray<NSString *> *)solveFromWord:(NSString *)word1 toWord:(NSString *)word2{
    Queue * queue = [[Queue alloc] init];
    if(![self.graph contains:word1] || ![self.graph contains:word2]){
        NSLog(@"Words do not exist in graph!");
        return nil;
    }
    Vertex * endVertex = nil;
    Vertex * initial = [self.graph getVertex:word1];
    initial.color = @"black";
    initial.distance = 0;
    [queue enqueue:initial];
    while(![queue isEmpty]){
        Vertex * current = (Vertex *)[queue dequeue];
        // NSLog(@"%@", current.value);
        if([current.value isEqualToString:word2]){
            endVertex = current;
            break;
        }
        for (Vertex * adjacent in current.adjacent){
            if([adjacent.color isEqualToString:@"white"]){
                adjacent.color = @"gray";
                adjacent.distance = current.distance + 1;
                adjacent.predecessor = current;
                [queue enqueue:adjacent];
            }
        }
        current.color = @"black";
    }
    if(endVertex == nil){
        NSLog(@"No path exists between words!");
        return nil;
    }
    else{
        NSMutableArray<NSString *> * array = [[NSMutableArray alloc] init];
        Vertex * current = endVertex;
        [array insertObject:current.value atIndex:0];
        while(current.predecessor != nil){
            current = current.predecessor;
            [array insertObject:current.value atIndex:0];
        }
        return array;
    }
}

-(NSArray<NSString *> *)getLinesFromFilePath:(NSString*)path{
    NSURL *myPath = [NSURL fileURLWithPath:path];
    
    // read the contents into a string
    NSString *myFile = [[NSString alloc] initWithContentsOfURL:myPath encoding:NSUTF8StringEncoding error:nil];
    
    // split our string into an array
    return [myFile componentsSeparatedByString:@"\r\n"];
}

-(NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *)
        generateBuckets:(NSArray<NSString *> *)lines withWordLength:(int)len{
    NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> * buckets = [[NSMutableDictionary alloc] init];
    
    for(NSString * str in lines){
        if([str length] == len){
            //Add to buckets
            for(int i = 0; i < len; i++){
                NSString * bucketName = [[[str substringToIndex:i] stringByAppendingString:@"_"] stringByAppendingString:[str substringFromIndex:i + 1]];
                NSMutableArray<NSString *> * arr = [buckets objectForKey:bucketName];
                if(arr != nil){
                    [arr addObject:str];
                }
                else{
                    arr = [[NSMutableArray alloc] init];
                    [arr addObject:str];
                    [buckets setObject:arr forKey:bucketName];
                }
            }
        }
    }
    return buckets;
}
    
-(Graph*)generateGraphFromBuckets:(NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *) buckets{
    int connections = 0;
    Graph * graph = [[Graph alloc] init];
    for(NSMutableArray<NSString *> * arr in [buckets allValues]){
        if([arr count] == 1){
            [graph addVertex:[arr firstObject]];
        }
        else{
            for(NSString * str1 in arr){
                for(NSString * str2 in arr){
                    if(![str1 isEqualToString:str2]){
                        [graph addConnection:str1 with:str2];
                        connections++;
                    }
                }
            }
        }
    }
    return graph;
}


@end
