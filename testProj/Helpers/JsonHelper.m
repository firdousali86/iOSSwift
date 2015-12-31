//
//  JsonHelper.m
//  SocialRadar
//
//  Created by Mohsin on 1/25/12.
//  Copyright (c) 2012 TenPearls. All rights reserved.
//

#import "JsonHelper.h"

@implementation JsonHelper

+ (id) objectWithData : (NSData *) data {
	CJSONDeserializer *jsonDeserializer = [CJSONDeserializer deserializer];
	NSError *error;
    
	return [jsonDeserializer deserialize:data error:&error];
}

+ (id) objectWithString : (NSString *) string {
    @try {
        return [JsonHelper objectWithData:[string dataUsingEncoding:NSUTF8StringEncoding]];
    }
    @catch (NSException *exception) {
        return [JsonHelper objectWithData:[@"" dataUsingEncoding:NSUTF8StringEncoding]];
    }
}

+ (NSString *) stringWithObject : (id) object {
	if (object == nil) {
		return @"";
	}
    
	CJSONSerializer *jsonSerializer = [CJSONSerializer serializer];
	NSError *error;
	return [[NSString alloc]                                 initWithData:
			[jsonSerializer serializeObject:object error:&error] encoding:NSUTF8StringEncoding];
}

+(NSString*)getStringFromJsonObject:(id)json {
    
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer];
    NSData *data = nil;
    NSError *error;
    if([json isKindOfClass:[NSArray class]]) {
        data = [jsonSerializer serializeArray:json error:&error];
    } else {
        data = [jsonSerializer serializeObject:json error:&error];
    }
    
    if (!data || error) {
        NSLog(@"error: %@", error);
    }
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+(id)getJsonObjectFromString:(NSString*)jsonString {
    
    NSError *error = nil;
    return [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:(NSJSONReadingOptions) kNilOptions error:&error];
}

@end