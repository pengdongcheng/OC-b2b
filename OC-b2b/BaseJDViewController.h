//
//  BaseJDViewController.h
//  b2b-ios
//
//  Created by liuqingmin on 15/11/11.
//  Copyright © 2015年 liuqingmin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  B2BConfigure;
typedef void (^completionBlock)(void);
typedef void (^leftBarBlock)(void);


@interface BaseJDViewController : UIViewController

- (void)setLeftButton:(UIImage *)image;
- (void)setRightButton:(UIImage *)image;
- (void)setRightButtonByTitle:(NSString *)title;
- (void)setTitle:(NSString *)title img:(NSString *)imgName;

- (IBAction)leftEvent:(UIButton *)sender;
- (IBAction)rightEvent:(UIButton *)sender;
- (void)centerEvent:(id)sender;

- (void)showMsg:(NSDictionary *)dic;

- (void)setNavBarColor:(UIColor *)color;

- (void)showLoading;
- (void)hideLoading;

- (void)initNavigationBar;
//比较2个数组的元素是否相同
//-(BOOL)comapreWithArry1:(NSArray *)arry1 andArry2:(NSArray *)arry2;

@property (nonatomic,copy) NSString *controllerName;
@property (nonatomic, copy) completionBlock completion;
@property(nonatomic,copy)leftBarBlock leftBlock;
@property (nonatomic, strong) UINavigationBar *navBar;
@property (nonatomic, strong) UINavigationItem *navItem;
@property(nonatomic,strong)B2BConfigure*config;
//@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) NSDictionary *rightDic; 
@property (nonatomic, strong) NSDictionary *centerDic;
@property (nonatomic, strong) NSDictionary *fristData;


@end
