//
//  B2bTabModle.h
//  OC-b2b
//
//  Created by 彭东成 on 16/8/23.
//  Copyright © 2016年 彭东成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>


@interface B2bTabModle : NSObject
/**
 *
 *  tabbar 名称
 */
@property (nonatomic,retain) NSString * title;
/**
 *
 *  控制器名称 名称
 */
@property (nonatomic,retain) NSString * vcName;

/**
 *
 *  tabbar 图片
 */
@property (nonatomic,retain) NSString * image;

/**
] *
 *  tabbar 选中图片
 */
@property (nonatomic,retain) NSString * selectedImage;

/**
 *
 *  是否隐藏标题
 */
@property (nonatomic,assign) BOOL isHideTitleBar;

/**
 *
 *  内嵌页面跳转的url
 */
@property (nonatomic,retain) NSString * url;

/**
 *
 *  是否下拉刷新，针对内嵌的m页面
 */
@property (nonatomic,assign) BOOL isPullToRefresh;

/**
 *
 *  是否支持页面滚动
 */
@property (nonatomic,assign) BOOL isNotScroll;


/**
 *
 *  页面的类型,目前1代表跳转webview页面,后续扩展。
 */
@property (nonatomic,retain) NSString *viewControllerType;
@end
