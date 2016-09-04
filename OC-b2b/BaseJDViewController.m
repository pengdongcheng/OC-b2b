//
//  BaseJDViewController.m
//  b2b-ios
//
//  Created by liuqingmin on 15/11/11.
//  Copyright © 2015年 liuqingmin. All rights reserved.
//

#import "BaseJDViewController.h"
#import "B2BConfigure.h"
#import "MBProgressHUD.h"
#import "B2BGlobalConfig.h"
#import "B2BUtils.h"

@interface BaseJDViewController ()<MBProgressHUDDelegate,UIGestureRecognizerDelegate>


@property (nonatomic,retain) MBProgressHUD *HUD;
@property (nonatomic,retain) MBProgressHUD *HUDforLoading;

@end

@implementation BaseJDViewController

- (void)initNavigationBar{
    
    _navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, UIScreenWidth, 64)];
    _navBar.barTintColor = RGBA(251, 251, 251, 1);
    _navBar.backgroundColor =  RGBA(251, 251, 251, 1);
    [_navBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg"] forBarMetrics:UIBarMetricsDefault];
    _navItem = [UINavigationItem new];
    NSLog(@"===%@",self.config.title);
    [self setTitle:self.config.title img:nil];
    
    
    
    BOOL showBack = _config.showBack;
    if (showBack) {
        // TODO
        [self setLeftButton:[UIImage imageNamed:@"nav_bar_back"]];
    }
    
    BOOL showRight = _config.showRight;
    if (showRight) {
        
        if(_config.rightBtnName)
            [self setRightButtonByTitle:_config.rightBtnName];
        
        if(_config.rightBtnImg){
            
            NSString *btnImgStr = _config.rightBtnImg;
            btnImgStr = [btnImgStr stringByReplacingOccurrencesOfString:@".png" withString:@""];
            NSString *imagePath = [[NSBundle mainBundle] pathForResource:btnImgStr ofType:@"png" inDirectory:kImageBasePath];
            [self setRightButton:[UIImage imageWithContentsOfFile:imagePath]];
        }
        
    }

    [_navBar pushNavigationItem:_navItem animated:NO];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    [self.view addSubview:_navBar];
    
}

- (void)setTitle:(NSString *)title img:(NSString *)imgName{
    
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[title stringByAppendingString:@" "]];

    if(imgName != nil){
        NSTextAttachment *attch = [[NSTextAttachment alloc] init];
        attch.image = [UIImage imageNamed:imgName];
        attch.bounds = CGRectMake(0, attch.image.size.height / 2, attch.image.size.width, attch.image.size.height); // 图片 垂直居中
        NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
        [str appendAttributedString:string];
    }

    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.alignment = NSTextAlignmentCenter;
    NSDictionary *attr = @{NSParagraphStyleAttributeName : style, // 绘图风格
                           NSFontAttributeName : [UIFont boldSystemFontOfSize:17], // 字体大小
                           NSForegroundColorAttributeName : [UIColor blackColor] // 字体颜色
                           };
    [str setAttributes:attr range:NSMakeRange(0, title.length)];
    
    label.attributedText = str;
    
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine |
        NSStringDrawingUsesLineFragmentOrigin |
    NSStringDrawingUsesFontLeading;
    label.frame = [str boundingRectWithSize:CGSizeMake(300, 300) options:options context:nil];
    
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(centerEvent:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [label addGestureRecognizer:tapGesture];
    
    self.navItem.titleView = label;
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.navigationController.viewControllers.count == 1){
        return NO;
    }else{
        return YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    //self.navigationController.navigationBar.barTintColor = RGBA(255, 255, 255, 1);
    //self.navigationController.navigationBar.translucent = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view setAutoresizesSubviews:YES];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //[self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
}

- (void)setNavBarColor:(UIColor *)color{
    
    
    _navBar.barTintColor = color;
    
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

- (IBAction)leftEvent:(UIButton *)sender{
    NSInteger count = [self.navigationController.viewControllers count];
    if (count > 1) {
        if ([self.config.url rangeOfString:@"TODO"].location != NSNotFound) { // TODO:待补充页面
            NSUInteger returnrank = self.config.returnRank == 0 ? 1 : self.config.returnRank;
            returnrank = returnrank > count - 1 ? count - 1 : returnrank;
            BaseJDViewController *vc = self.navigationController.childViewControllers[count-returnrank-1];
            [self.navigationController popToViewController:vc animated:YES];
        }else {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else{
        [self dismissViewControllerAnimated:YES completion:_completion];
    }
}

- (IBAction)rightEvent:(UIButton *)sender{
    
}

- (void)centerEvent:(id)sender{

}

- (void)setLeftButton:(UIImage *)image{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame: CGRectMake(0, 0, 25, 25)];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateHighlighted];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    [_navItem setLeftBarButtonItem:leftButton];
    [button addTarget:self action:@selector(leftEvent:)forControlEvents:UIControlEventTouchUpInside];
}

- (void)setRightButton:(UIImage *)image{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame: CGRectMake(0, 0, 20, 20)];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateHighlighted];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    [_navItem setRightBarButtonItem:rightButton];
    [button addTarget:self action:@selector(rightEvent:)forControlEvents:UIControlEventTouchUpInside];
}


- (void)setRightButtonByTitle:(NSString *)title{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    CGSize size = B2BUtils.getTitleBound(title,[UIFont boldSystemFontOfSize:20],CGSizeMake(80, 30));
    [button setFrame: CGRectMake(0, 0, size.width, size.height)];
    [button setTitleColor:RGBA(51, 51, 51, 1) forState:UIControlStateNormal];
    [button setTitleColor:RGBA(51, 51, 51, 1) forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    [_navItem setRightBarButtonItem:rightButton];
    [button addTarget:self action:@selector(rightEvent:)forControlEvents:UIControlEventTouchUpInside];
}


- (void)showMsg:(NSDictionary *)data{
    NSString *str = data[@"msg"];
    //兼容web换行
    if([str rangeOfString:@"<br>"].location != NSNotFound){
        str =  [str stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    }
    NSString *showType = data[@"showType"]==nil?data[@"showType"]:@"succ";
    _HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];

    // Configure for text only and offset down
    if([showType isEqualToString:@"succ"]) {
        _HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"prompt _03"]];

    }else{
        _HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"prompt _02"]];}
    // Set custom view mode
    _HUD.mode = MBProgressHUDModeCustomView;
    _HUD.margin = 10.f;
    _HUD.removeFromSuperViewOnHide = YES;
    if (str) {
        _HUD.detailsLabelText = str;
    }
    [_HUD hide:YES afterDelay:1];
}

- (void)showLoading{
    
    _HUDforLoading = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _HUD.removeFromSuperViewOnHide = YES;
    [_HUDforLoading show:YES];
}
- (void)hideLoading{
    
    if (_HUDforLoading != nil) {
        [_HUDforLoading hide:YES];
    }
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

