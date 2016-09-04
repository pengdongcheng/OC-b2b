//
//  B2BConfigure.m
//  b2b-ios
//
//  Created by 彭东成 on 15/12/24.
//  Copyright © 2015年 liuqingmin. All rights reserved.
//

#import "B2BConfigure.h"
#import <MJExtension.h>
@implementation B2BConfigure
//字典中的字段与模型中的属性不一样
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"dataInit":@"initData"};
}


@end
