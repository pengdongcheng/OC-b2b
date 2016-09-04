//
//  BaseJDWebviewControllerViewController.m
//  OC-b2b
//
//  Created by 彭东成 on 16/9/4.
//  Copyright © 2016年 彭东成. All rights reserved.
//

#import "BaseJDWebviewController.h"

@interface BaseJDWebviewController ()

@end

@implementation BaseJDWebviewController
- (id)initWithDataByDic:(NSDictionary *)data{
    
    self = [super init];
    
    if (self) {
        B2BConfigure *config = [B2BConfigure mj_objectWithKeyValues:data[@"config"]];
        NSLog(@"%@",config.title);
        self.config =config;
        //        self.data = data;
        //
        //        _url = self.data[@"config"][@"url"];
        //        _urlType = self.data[@"config"][@"urlType"];
        //
//        if(self.config.dataInit){
//            self.fristData = self.config.dataInit;
//        }
        
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.config.title);
    if(self.config.hideTitleBar==NO){
        NSLog(@"%@",self.config.title);
        [self initNavigationBar];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
