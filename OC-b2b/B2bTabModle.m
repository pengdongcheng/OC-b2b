//
//  B2bTabModle.m
//  OC-b2b
//
//  Created by 彭东成 on 16/8/23.
//  Copyright © 2016年 彭东成. All rights reserved.
//

#import "B2bTabModle.h"


@implementation B2bTabModle

//字典中的字段与模型中的属性不一样
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"dataInit":@"initData"};
}
@end
