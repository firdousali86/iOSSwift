//
//  PList.m
//  Guardian
//
//  Created by mohsin on 11/11/14.
//  Copyright (c) 2014 10Pearls. All rights reserved.
//

#import "PList.h"

@implementation PList

+(PList*)getInstance{
    static PList *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(id)read:(NSString*)file andRoot:(NSString*)root{
    NSDictionary *content = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]
                                                                        pathForResource:file
                                                                        ofType:@"plist"]];
    if(root == nil)
        return content;
    
    if([content objectForKey:root])
        return [content objectForKey:root];
    
    return nil;
}

@end
