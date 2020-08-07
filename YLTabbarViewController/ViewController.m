//
//  ViewController.m
//  YLTabbarViewController
//
//  Created by mac on 2020/6/30.
//  Copyright © 2020 fanyoule. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "YLTabBarViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.__title = @"123";
    self.view.backgroundColor = UIColor.yellowColor;

   
    UIButton * B_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [B_btn setTitle:@"跳转" forState:UIControlStateNormal];
    [B_btn addTarget:self action:@selector(buttonclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:B_btn];
    [B_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        
    }];
    UIButton * B_btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
       [B_btn2 setTitle:@"跳转Tab" forState:UIControlStateNormal];
       [B_btn2 addTarget:self action:@selector(buttonclicked2:) forControlEvents:UIControlEventTouchUpInside];
       [self.view addSubview:B_btn2];
       [B_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
           make.centerX.mas_equalTo(self.view);
           make.centerY.mas_equalTo(self.view).mas_offset(40);
       }];
    // Do any additional setup after loading the view.
}
-(void)buttonclicked2:(UIButton *)btn{
  [self.navigationController popToRootViewControllerAnimated:YES];
  YLTabBarViewController * tab = (YLTabBarViewController *)  [UIApplication sharedApplication].keyWindow.rootViewController;
  [tab changeIndex:2];
   
    
}
-(void)buttonclicked:(UIButton *)btn{
    ViewController * vc = [[ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

@end
