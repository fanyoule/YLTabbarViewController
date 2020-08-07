//
//  YLTabBarViewController.m
//  YLTabbarViewController
//
//  Created by mac on 2020/7/1.
//  Copyright © 2020 fanyoule. All rights reserved.
//

#import "YLTabBarViewController.h"
#import "ViewController.h"
#import "YLNavigationViewController.h"
#import "YLTwoViewController.h"
/** 屏幕宽高 */
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
// 导航条高度
#define kStatusBarHeight (([UIApplication sharedApplication].statusBarFrame.size.height>=44.0f)? 44.0 : 20.0)
#define kTabBarHeight (([UIApplication sharedApplication].statusBarFrame.size.height>=44.0f)? 83.0 : 49.0)
@interface YLTabBarViewController ()
<
YLTabbarDelegate,
UINavigationControllerDelegate
>

@end

@implementation YLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.hidden = YES;
    
    self.tabbars = [[YLTabbar_View alloc]initWithFrame:CGRectMake(0, kScreenH-kTabBarHeight, kScreenW, kTabBarHeight) Titles:@[@"1",@"2",@"3"] itemImages:@[@"tab_off_index",@"tab_off_message",@"tab_off_my"] selectImages:@[@"tab_on_index",@"tab_on_message",@"tab_on_my"] withTitleColor:UIColor.redColor withTitleSelectColor:UIColor.purpleColor];
    self.tabbars.backgroundColor = UIColor.whiteColor;
    self.tabbars.delegate = self;
    [self.view addSubview:self.tabbars];
    
    UIViewController * hall = [self loadControllerWithString:@"ViewController"];
    UIViewController *a = [self loadControllerWithString:@"YLTwoViewController"];
    UIViewController *d = [self loadControllerWithString:@"ViewController"];
    self.viewControllers = @[hall,a,d];

    
}
- (UIViewController *)loadControllerWithString:(NSString *)string {
    Class Vclass = NSClassFromString(string);
    UIViewController *vc = [[Vclass alloc] init];
    YLNavigationViewController * nav = [[YLNavigationViewController alloc] initWithRootViewController:vc];
    nav.navigationBarHidden = YES;
    nav.delegate = self;
    return nav;
}
-(void)changeIndex:(NSInteger)index{
    if (index>self.tabBar.items.count) {
        return;
    }
    self.tabbars.selectIndex = index;
    self.selectedIndex = index;
    
}
-(void)YLTabbar_selectedIndex:(NSInteger)index{
    NSLog(@"index---%ld",index);
    self.selectedIndex = index;
}

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.tabBar.hidden = YES;
    UIViewController * root = navigationController.viewControllers.firstObject;
    if (viewController != root) {
        self.tabbars.hidden = YES;
    }else{
        self.tabbars.hidden = NO;
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
