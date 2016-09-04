//
//  B2BConfigure.h
//  b2b-ios
//
//  Created by 彭东成 on 15/12/24.
//  Copyright © 2015年 liuqingmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>
@interface B2BConfigure : NSObject
//方法类型
@property(nonatomic,copy)NSString *type;
//打开页面的名字
@property(nonatomic,copy)NSString *name;
//导航栏标题
@property(nonatomic,copy)NSString *title;
//是否隐藏taBbar
@property(nonatomic,assign)BOOL hideBottomBar;
//是否隐藏导航栏
@property(nonatomic,assign)BOOL hideTitleBar;
//是否展示返回按钮
@property(nonatomic,assign)BOOL showBack;
//是否展示导航右按钮
@property(nonatomic,assign)BOOL showRight;
//打开web页面的url
@property(nonatomic,copy)NSString *url;
//打开web页面的类型
@property(nonatomic,copy)NSString *urlType;
//是否支持下拉刷新
@property(nonatomic,assign)BOOL pullToRefresh;
//是否判断登陆
@property(nonatomic,assign)BOOL loginCheck;
//是否支持滑动
@property(nonatomic,assign)BOOL notScroll;
//右边按钮的名字
@property(nonatomic,copy)NSString *rightBtnName;
//右边按钮的图片
@property(nonatomic,copy)NSString *rightBtnImg;
//传过来的内容
@property(nonatomic,copy)NSDictionary * dataInit;
//要返回的层数
@property(nonatomic,assign)NSInteger returnRank;

//-(instancetype)configureWithDict:(NSDictionary *)dic;
@end
