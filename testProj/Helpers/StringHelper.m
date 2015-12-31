//
//  StringHelper.m
//  UnitedWay211
//
//  Created by Firdous on 15/04/2014.
//  Copyright (c) 2014 mohsin. All rights reserved.
//

#import "StringHelper.h"

@implementation StringHelper

+ (NSString *) validateEmptyString : (NSString *) string {
	if ([StringHelper isNull:string]) {
		return @"";
	}
	return string;
}

+ (NSString *) validateNilString : (NSString *) string {
	if ([StringHelper isEmptyOrNull:string]) {
		return nil;
	}
	return string;
}

+ (BOOL) isEmptyOrNull : (NSString *) string {
	if ([StringHelper isNull:string] || [StringHelper isEmpty:string]) {
		return TRUE;
	} else {      return FALSE; }
}

+ (BOOL) isEmpty : (NSString *) string {
    if(![string isKindOfClass:[NSString class]])
        return TRUE;
    
	if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
		return TRUE;
	} else {      return FALSE; }
}

+ (BOOL) isNull : (NSString *) string {
	if (string == nil || ![string isKindOfClass:[NSString class]]) {
		return TRUE;
	} else {      return FALSE; }
}

@end
