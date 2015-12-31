//
//  Utils.m
//  UnitedWay211
//
//  Created by Firdous on 18/04/2014.
//  Copyright (c) 2014 mohsin. All rights reserved.
//

#import "Utils.h"
#import "StringHelper.h"
#import "PList.h"

@implementation Utils

+ (CGSize) getSizeWithString:(NSString *)text font:(UIFont *)font {
    return [text sizeWithAttributes:@{NSFontAttributeName : font}];
}

+ (CGSize) getSizeWithString:(NSString*)text font:(UIFont*)font size:(CGSize)constrainedSize{
    
    CGRect textRect = [text boundingRectWithSize:constrainedSize
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:font}
                                         context:nil];
    
    return CGSizeMake(textRect.size.width + 5, textRect.size.height + 5);
}

+ (CGFloat) getObjectYPlusHeight:(CGRect)frame{
    return frame.origin.y + frame.size.height;
}

+ (CGSize) getScreenSize{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    return CGSizeMake(screenWidth, screenHeight);
}

+ (NSString*)getStateCodeWithStateName:(NSString*)stateName{
    
    if ([stateName isEqualToString:@"District of Columbia"]) {
        return @"DC";
    }
    if ([stateName isEqualToString:@"Maryland"]) {
        return @"MD";
    }
    if ([stateName isEqualToString:@"Virginia"]) {
        return @"VA";
    }
    
    return @"";
}

+ (void)showFeatureNotImplemented{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Not Implemented" message:@"Feature Not Implemented" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

+ (void)resetArray:(NSMutableArray*)arr{
    [arr removeAllObjects];
    [arr addObject:@""];
}

+ (NSMutableArray*)sortStringArray:(NSMutableArray*)unsorted forKey:(NSString *)key{
    NSSortDescriptor *aSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:YES comparator:^(id obj1, id obj2) {
        
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    return [NSMutableArray arrayWithArray:[unsorted sortedArrayUsingDescriptors:[NSArray arrayWithObject:aSortDescriptor]]];
}

+ (BOOL)searchSubstringInString:(NSString*)string toSearch:(NSString*)search{
    
    if ([string rangeOfString:search].location == NSNotFound) {
        return NO;
    } else {
        return YES;
    }
}

+ (NSString *) getLanguageCode:(NSString *)language {
    
    NSDictionary *languageDictionary = [[PList getInstance] read:@"LanguageCodes" andRoot:nil];
    NSString *ISO639_2LanguageCode = [languageDictionary objectForKey:language];
    
    if ([StringHelper isEmptyOrNull:ISO639_2LanguageCode])
        return language;
    
    return ISO639_2LanguageCode;
}

+ (NSString *) encodeURL:(NSString*)url {
    
    NSMutableString * output = [NSMutableString string];
    const unsigned char * source = (const unsigned char *)[url UTF8String];
    int sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}

+ (BOOL) isSimulator{
    return ([[[UIDevice currentDevice] model]  isEqual: @"iPhone Simulator"] || [[[UIDevice currentDevice] model]  isEqual: @"iPad Simulator"]);
}

+ (BOOL)isiPad{
    if ([[[UIDevice currentDevice] model] containsString:@"iPad"]) {
        return YES;
    }
    
    return NO;
}

+(NSArray*)mergeArrays:(NSArray*)arrays{
    NSMutableArray *mergedArray = [NSMutableArray new];
    
    for (NSArray *array in arrays) {
        for (id content in array) {
            [mergedArray addObject:content];
        }
    }

    return [mergedArray copy];
}

+(NSString*)getBase64EncodedForData:(NSData *)data{
    if (data) {
        NSString *dataString = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        return dataString;
    }
    
    return nil;
}

+(void)writeImageFile:(id)data filename:(NSString*)fileName{
    if ([data isKindOfClass:[UIImage class]]) {
        data = UIImagePNGRepresentation(data);
    }
    
    NSArray *paths2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory2 = [paths2 objectAtIndex:0];
    NSString *dataPath2 = [documentsDirectory2 stringByAppendingPathComponent:fileName];
    // Save it into file system
    [(NSData*)data writeToFile:dataPath2 atomically:YES];
}

@end
