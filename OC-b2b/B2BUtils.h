//
//  B2BUtils.h
//  b2b-ios
//
//  Created by 王建平 on 15/12/16.
//  Copyright © 2015年 liuqingmin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct
{
    /**
     *  @author 王建平, 15-12-16 13:12:28
     *
     *  判断字符串是否有效字符串，主要判断为空，null
     *
     *  @param str 要校验的字符串
     *
     *  @return 是否有效
     */
     BOOL (*validateString)(NSString *string);
    
    /**
     *  @author 王建平, 15-12-16 14:12:52
     *
     *  判断数组是否有效
     */
     BOOL (*validateArray)(NSArray *array);
    
    /**
     *  @author 王建平, 15-12-16 14:12:14
     *
     *  判断字典是否有效
     */
     BOOL (*validateDictionary)(NSDictionary *dictionary);
    
    /**
     *  @author 王建平, 15-12-16 15:12:47
     *
     *  返回系统CFUUIDCreate的id
     *
     *  @param creatUUID
     *
     *  @return UUID
     */
     NSString *(*creatUUID)();
    
    /**
     *  @author 王建平, 15-12-16 15:12:49
     *
     *  获取开源openuuid 存储在剪贴板中
     *
     *  @param getOpenUUID
     *
     *  @return OpenUUID
     */
     NSString *(*getOpenUUID)();
    
    /**
     *  @author 王建平, 15-12-16 15:12:09
     *
     *  系统提供的广告id,如果用户不允许则获取不到。
     *  如果用户重置这个值会变化
     *  @param getAdid
     *
     *  @return adid
     */
     NSString *(*getAdid)();
    
    /**
     *  @author 王建平, 15-12-16 17:12:51
     *
     *  获取plist中设置的app的版本号
     *
     *  @param getAppVersion
     *
     *  @return 版本号，如果未设置则获取到1.0版本
     */
     NSString *(*getAppVersion)();
    
    /**
     *  @author 王建平, 15-12-16 17:12:21
     *
     *  获取系统版本号的字符串
     *
     *  @param getSystemVersion
     *
     *  @return
     */
     NSString *(*getSystemVersion)();
    
    /** 获取 bundleName */
    NSString *(*getBundleName)();
    
    /**
     *  比较两个数组是否相同
     *
     *  @param arr1 数组1
     *  @param arr2 数组2
     *
     *  @return 比较结果
     */
    BOOL (*compareArrays)(NSArray *arr1,NSArray*arr2);
    
    /**
     *  比较两个字典是否相同
     *
     *  @param dic1 字典1
     *  @param dic2 字典2
     *
     *  @return 比较结果
     */
    BOOL (*compareDics)(NSDictionary *dic1,NSDictionary *dic2);
    
    /**
     *  截取URL中参数
     *
     *  @param URL 需要截取URL
     *
     *  @return 参数字典
     */
    NSDictionary *(*getparamsWithUrl)(NSString *URL);
        
    /**
     *  获取文本所占区域size
     *
     *  @param txt 需计算文本
     *  @param font 文本字体大小
     *  @param size 限制size
     *
     *  @return 返回文本所占区域size
     */
    CGSize (*getTitleBound)(NSString *txt,UIFont *font,CGSize size);
    
} B2BUtils_t;

extern B2BUtils_t B2BUtils;


