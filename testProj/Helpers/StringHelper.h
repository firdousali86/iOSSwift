//
//  StringHelper.h
//  UnitedWay211
//
//  Created by Firdous on 15/04/2014.
//  Copyright (c) 2014 mohsin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StringHelper : NSObject

+ (NSString *)validateEmptyString : (NSString *)string;

+ (NSString *)validateNilString : (NSString *)string;

+ (BOOL)isEmptyOrNull : (NSString *)string;

@end
