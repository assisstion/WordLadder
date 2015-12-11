//
//  main.m
//  WordLadder
//
//  Created by Markus Feng on 12/3/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WordLadder.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        WordLadder * ladder = [[WordLadder alloc] init];
        
        while(true){
        
            char from[50];
            char to[50];
            
            printf("From word: ");
            scanf(" %s", from);
            NSString * fromString = [[NSString alloc] initWithUTF8String:from];
            
            printf("To word: ");
            scanf(" %s", to);
            NSString * toString = [[NSString alloc] initWithUTF8String:to];
            
            if([fromString length] != [toString length]){
                NSLog(@"Words are of different length!");
                continue;
            }
            
            [ladder generateGraphFromFile:@"/Users/mfeng17/Documents/Advanced Computer Science/WordLadder/WordLadder/dictionary.txt" withWordLength:(int)[fromString length]];
            
            //Example pairs:
            //FOOL - SAGE
            //SMALL - LARGE
            //SERVER - MASTER
            //FLYING - CIRCUS
           
            NSArray<NSString *> * path = [ladder solveFromWord:fromString toWord:toString];
            for(NSString * str in path){
                NSLog(@"%@", str);
            }
        }
    }
    return 0;
}
