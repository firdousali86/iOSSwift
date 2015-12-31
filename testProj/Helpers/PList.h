//
//  PList.h
//  Guardian
//
//  Created by mohsin on 11/11/14.
//  Copyright (c) 2014 10Pearls. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PList : NSObject
+(PList*)getInstance;

-(id)read:(NSString*)file andRoot:(NSString*)root;

@end
