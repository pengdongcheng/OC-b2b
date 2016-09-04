//
//  B2BUtils.m
//  b2b-ios
//
//  Created by 王建平 on 15/12/16.
//  Copyright © 2015年 liuqingmin. All rights reserved.
//

#import "B2BUtils.h"
#include "OpenUDID.h"
#import <AdSupport/AdSupport.h>


static BOOL validateString(NSString *string)
{
    BOOL result = NO;
    if (string && [string isKindOfClass:[NSString class]] && [string length]) {
        result = YES;
    }
    return result;
}

static BOOL validateArray(NSArray *array)
{
    BOOL result = NO;
    if (array && [array isKindOfClass:[NSArray class]] && [array count]) {
        result = YES;
    }
    return result;
}

static BOOL validateDictionary(NSDictionary *dictionary)
{
    BOOL result = NO;
    if (dictionary && [dictionary isKindOfClass:[NSDictionary class]] && [dictionary count]) {
        result = YES;
    }
    return result;
}

static NSString * creatUUID()
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    NSString *nonce = (__bridge NSString *)string;
    CFRelease(string);
    return nonce;
}

static NSString * getOpenUUID()
{
    NSString *udid = [OpenUDID value];
    if (udid) {
        return udid;
    }
    return @"";
}

static NSString * getAdid()
{
    if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
        NSUUID *uuid = [[ASIdentifierManager sharedManager] advertisingIdentifier];
        if (uuid) {
            return [uuid UUIDString];
        }
    }
    return @"";
}

static NSString * getAppVersion()
{
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    if (nil == version) {
        version = @"1.0";
    }
    return version;
}

static NSString * getSystemVersion()
{
    return [UIDevice currentDevice].systemVersion;
}

static NSString * getBundleName()
{
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
}

static BOOL compareArrays(NSArray *arr1,NSArray *arr2)
{
    BOOL equal = NO;
    if (arr1.count == arr2.count) {
        
        NSPredicate *thePredicate = [NSPredicate predicateWithFormat:@"NOT (SELF in %@)", arr2];
        NSArray *unableEditArray = [arr1 filteredArrayUsingPredicate:thePredicate];
        
        equal = unableEditArray.count == 0 ? YES : NO;
        
    }
    
    return equal;
}

static BOOL compareDics(NSDictionary *dic1,NSDictionary *dic2)
{
    NSArray *arrykey1 = [dic1 allKeys];
    NSArray *arrykey2 = [dic2 allKeys];
    NSArray *arryvalue1 = [dic1 allValues];
    NSArray *arryvalue2 = [dic2 allValues];
    BOOL keyequal = compareArrays(arrykey1, arrykey2);
    BOOL valuequal = compareArrays(arryvalue1, arryvalue2);
    return keyequal && valuequal;
}

static NSDictionary * getparamsWithUrl(NSString *URL)
{
    NSString *paramsStr = [URL componentsSeparatedByString:@"?"][1];
    NSArray *arry = [paramsStr componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    NSString *title;
    for (NSString* param in arry) {
        NSString *key = [param componentsSeparatedByString:@"="][0];
        NSString *value = [param componentsSeparatedByString:@"="][1];
        if ([key isEqual:@"msg"]) {
            value = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            title = value;
        }
        [params setValue:value forKey:key];
        
    }
    
    return params;
}

static CGSize getTitleBound(NSString *txt,UIFont *font,CGSize size)
{
    CGSize _size;
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine |
    
    NSStringDrawingUsesLineFragmentOrigin |
    
    NSStringDrawingUsesFontLeading;
    
    _size = [txt boundingRectWithSize:size options: options attributes:attribute context:nil].size;
    
    return _size;
}


B2BUtils_t B2BUtils = {
    validateString,
    validateArray,
    validateDictionary,
    creatUUID,
    getOpenUUID,
    getAdid,
    getAppVersion,
    getSystemVersion,
    getBundleName,
    compareArrays,
    compareDics,
    getparamsWithUrl,
    getTitleBound,
};

