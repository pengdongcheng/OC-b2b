//
//  B2BGlobalConfig.h
//  b2b-ios
//
//  Created by 王建平 on 15/12/14.
//  Copyright © 2015年 liuqingmin. All rights reserved.
//

#ifndef B2BGlobalConfig_h
#define B2BGlobalConfig_h

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIScreenWidth [[UIScreen mainScreen] bounds].size.width
#define UIScreenHeight [[UIScreen mainScreen] bounds].size.height
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define kLoginId @"user" //user id
#define kLogin @"loginCookies" //user cookie
#define kLoginNotice @"loginNotice"
#define kHtmlBasePath @"html" //html Documents
#define kImageBasePath @"images" //img Documents
#define kGpsChangeNotification @"kGpsChangeNotification"
#define kHtmlSandboxVersion @"htmlSandboxVersion"
//#define SERVER_URL @"http://127.0.0.1:8080/"
//#define SERVER_URL @"http://192.168.104.120/"
//#define SERVER_URL @"http://1.valkyrie1.sinaapp.com/html_b2b/"
#define SERVER_URL @"http://m-b2b.jcloud.com/"
//#define SERVER_URL @"http://test-m-b2b.jcloud.com/"


#define Update_URL @"/m/public/update"
#define UploadImg_URL @"m/public/uploadImg"

#ifdef DEBUG
#define CLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define CLog(format, ...)
#endif

//crash 上报使用的是腾讯的bugly平台
#define crash_appid @"900015403"

/*
 微信AppID
 注意当你修改微信AppID时，除了修改 B2B_IPhone_WECHAT_APP_KEY 值，还需要做一下操作：
 1、在Xcode中，选择你的工程设置项，选中“TARGETS”一栏，在“info”标签栏的“URL type“修改“URL scheme”为你所注册的应用程序id。
 2、如果使用的是Xcode3或更低版本，则需要在plist文件中修改URL type值
 */
#define B2B_IPhone_WECHAT_APP_KEY @"wxe8a409fa734657df" // 微信开发者ID,和安卓同步 2016.1.6 liubaopeng

// 百度Push API KEY
#define B2B_IPhone_BDPush_API_KEY @"XCPNkYZHCYHf4szxfraEjGRj" 

#endif /* B2BGlobalConfig_h */
