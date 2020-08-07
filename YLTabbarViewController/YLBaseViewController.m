//
//  YLBaseViewController.m
//  YLTabbarViewController
//
//  Created by mac on 2020/7/6.
//  Copyright © 2020 fanyoule. All rights reserved.
//

#import "YLBaseViewController.h"
#define   TOPBAR_HEIGHT       ([[UIApplication sharedApplication] statusBarFrame].size.height + [UINavigationController new].navigationBar.frame.size.height)
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kStatusBarH     ([UIApplication sharedApplication].statusBarFrame.size.height)
#define YLNavigationBarH 44

@interface YLBaseViewController ()

@end

@implementation YLBaseViewController
- (BOOL)hasNavView{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //处理 ios13 模态不全屏问题
    self.modalPresentationStyle = 0;
    self.view.autoresizesSubviews = YES;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
       CGFloat nav_height = kStatusBarH;
       
       if ([self hasNavView]) {
           _navgationSuperView = [[UIView alloc]init];
           _navgationSuperView.backgroundColor = UIColor.purpleColor;
           [self.view addSubview:_navgationSuperView];
           
           _navigationView = [[UIView alloc]init];
           [_navgationSuperView addSubview:_navigationView];
           
           _leftBannerBt =[[YLBaseButton alloc]initWithType:LZButtonBack position:LZLeftNavFirst];
           [_leftBannerBt addTarget:self action:@selector(onTouchBackBt:) forControlEvents:UIControlEventTouchUpInside];
           [_navigationView addSubview:_leftBannerBt];
           
           _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(50.0f, 0.0f, kScreenWidth- 100, YLNavigationBarH)];
           _titleLabel.textAlignment = NSTextAlignmentCenter;
           _titleLabel.font = [UIFont boldSystemFontOfSize:18];
           _titleLabel.textColor =UIColor.whiteColor;
           [_navigationView addSubview:_titleLabel];
           _titleLabel.text = ___title;
           
           
           _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, YLNavigationBarH-.5, kScreenWidth, .5)];
           _lineView.backgroundColor = UIColor.clearColor;
           [_navigationView addSubview:_lineView];
           
           nav_height += YLNavigationBarH;
           [_navgationSuperView setFrame:CGRectMake(0, 0, kScreenWidth, nav_height)];
           CGRect navFrame = _navgationSuperView.frame;
           navFrame.origin.y = kStatusBarH;
           navFrame.size.height = YLNavigationBarH;
           [_navigationView setFrame:navFrame];
       }
    if (self.navigationController.childViewControllers.count>1) {
        self.leftBannerBt.hidden = NO;
    }else{
        self.leftBannerBt.hidden = YES;
    }

    // Do any additional setup after loading the view.
}
//如果返回时有操作，请记住调用super方法
-(void)onTouchBackBt:(YLBaseButton *)button{
    id controller = [self.navigationController popViewControllerAnimated:YES];
    if (!controller) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
-(void)setTitle:(NSString *)title{
    ___title = title;
    _titleLabel.text = ___title;
}



-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
    return UIStatusBarStyleDefault;
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
