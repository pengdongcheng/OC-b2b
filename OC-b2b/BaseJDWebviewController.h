//
//  BaseJDWebviewControllerViewController.h
//  OC-b2b
//
//  Created by 彭东成 on 16/9/4.
//  Copyright © 2016年 彭东成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "B2BConfigure.h"
#import "BaseJDViewController.h"
@interface BaseJDWebviewController : BaseJDViewController
//@property(nonatomic,strong)B2BConfigure *config;
- (id)initWithDataByDic:(NSDictionary *)data;
@end
