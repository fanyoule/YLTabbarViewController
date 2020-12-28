//
//  ViewController.m
//  YLTabbarViewController
//
//  Created by mac on 2020/6/30.
//  Copyright © 2020 fanyoule. All rights reserved.
// wbs gantt

#import "ViewController.h"
#import "Masonry.h"
#import "YLTabBarViewController.h"
#import "TKTTSManager.h"
#import "YLTwoViewController.h"

@interface ViewController ()
@property (nonatomic, strong) TKTTSManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.__title = @"123";
    [self creatTTS];
    self.view.backgroundColor = UIColor.yellowColor;

   
    UIButton * B_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [B_btn setTitle:@"跳转" forState:UIControlStateNormal];
    [B_btn addTarget:self action:@selector(buttonclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:B_btn];
    [B_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        
    }];
    UIButton * B_btn_stop = [UIButton buttonWithType:UIButtonTypeSystem];
    [B_btn_stop setTitle:@"结束" forState:UIControlStateNormal];
    [B_btn_stop addTarget:self action:@selector(buttonclickedstop:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:B_btn_stop];
    [B_btn_stop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(B_btn).mas_offset(20);
    }];
    UIButton * B_btn_zanting = [UIButton buttonWithType:UIButtonTypeSystem];
    [B_btn_zanting setTitle:@"暂停" forState:UIControlStateNormal];
    [B_btn_zanting addTarget:self action:@selector(buttonclickedzanting:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:B_btn_zanting];
    [B_btn_zanting mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(B_btn_stop).mas_offset(20);
    }];
    UIButton * B_btn_jixu = [UIButton buttonWithType:UIButtonTypeSystem];
    [B_btn_jixu setTitle:@"继续" forState:UIControlStateNormal];
    [B_btn_jixu addTarget:self action:@selector(buttonclickedjixu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:B_btn_jixu];
    [B_btn_jixu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(B_btn_zanting).mas_offset(20);
    }];
    
    
    
    
    
    UIButton * B_btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
       [B_btn2 setTitle:@"跳转Tab" forState:UIControlStateNormal];
       [B_btn2 addTarget:self action:@selector(buttonclicked2:) forControlEvents:UIControlEventTouchUpInside];
       [self.view addSubview:B_btn2];
       [B_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
           make.centerX.mas_equalTo(self.view);
           make.centerY.mas_equalTo(self.view).mas_offset(100);
       }];
    // Do any additional setup after loading the view.
}
-(void)creatTTS{
    _manager = [TKTTSManager sharedInstance];
    NSString *content = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"content" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
    _manager.speakString = @"艾斯欧DAU噢isU盾噢埃索IDuaoisuoiduoiasduoia娿 阿斯嗲速递奥斯以屌丝OA搜IDuoias";
    
}



-(void)buttonclicked2:(UIButton *)btn{
  [self.navigationController popToRootViewControllerAnimated:YES];
  YLTabBarViewController * tab = (YLTabBarViewController *)  [UIApplication sharedApplication].keyWindow.rootViewController;
  [tab changeIndex:2];
   
    
}
#pragma mark -- 结束
-(void)buttonclickedstop:(UIButton *)btn{
    [_manager stopSpeak:TKStopSpeakTypeImmediate];
}
#pragma mark -- 暂停
-(void)buttonclickedzanting:(UIButton *)btn{
    [_manager pauseSpeak:TKStopSpeakTypeWord];
}
#pragma mark -- 继续
-(void)buttonclickedjixu:(UIButton *)btn{
    [_manager continueSpeak];
}
#pragma mark -- 开始
-(void)buttonclicked:(UIButton *)btn{
//    [_manager startSpeak];
//    return;
    
    YLTwoViewController * vc = [[YLTwoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

@end
