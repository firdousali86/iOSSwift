//
//  Utils.h
//  UnitedWay211
//
//  Created by Firdous on 18/04/2014.
//  Copyright (c) 2014 mohsin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utils : NSObject

+ (CGSize) getSizeWithString:(NSString *)text font:(UIFont *)font;
+ (CGSize) getSizeWithString:(NSString*)text font:(UIFont*)font size:(CGSize)constrainedSize;
+ (CGFloat) getObjectYPlusHeight:(CGRect)frame;
+ (CGSize) getScreenSize;
+ (NSString*)getStateCodeWithStateName:(NSString*)stateName;
+ (void)showFeatureNotImplemented;
+ (void)resetArray:(NSMutableArray*)arr;
+ (NSMutableArray*)sortStringArray:(NSMutableArray*)unsorted forKey:(NSString*)key;
+ (BOOL)searchSubstringInString:(NSString*)string toSearch:(NSString*)search;

+ (NSString *) getLanguageCode:(NSString *)language;
+ (BOOL) isSimulator;
+ (BOOL)isiPad;

+(NSArray*)mergeArrays:(NSArray*)arrays;

+(NSString*)getBase64EncodedForData:(NSData*)data;
+(void)writeImageFile:(id)data filename:(NSString*)fileName;

@end
