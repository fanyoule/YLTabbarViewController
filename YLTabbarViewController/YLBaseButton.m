//
//  YLBaseButton.m
//  DHMall
//
//  Created by mac on 2019/9/17.
//  Copyright © 2019 fanyoule. All rights reserved.
//

#import "YLBaseButton.h"
#define YLNavigationBarH 44
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

@implementation YLBaseButton
@synthesize __title;
-(void)dealloc{
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    CGFloat space = self.spaceBetweenTitleAndImage;
    
    CGFloat titleW = CGRectGetWidth(self.titleLabel.bounds);
    CGFloat titleH = CGRectGetHeight(self.titleLabel.bounds);
    
    CGFloat imageW = CGRectGetWidth(self.imageView.bounds);
    CGFloat imageH = CGRectGetHeight(self.imageView.bounds);
    
    CGFloat btnCenterX = CGRectGetWidth(self.bounds)/2;//按钮中心点X的坐标（以按钮左上角为原点的坐标系）
    CGFloat imageCenterX = btnCenterX - titleW/2;//imageView中心点X的坐标（以按钮左上角为原点的坐标系）
    CGFloat titleCenterX = btnCenterX + imageW/2;//titleLabel中心点X的坐标（以按钮左上角为原点的坐标系）
    
    switch (self.imageAlignment)
    {
        case MMImageAlignmentTop:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(imageH/2+ space/2, -(titleCenterX-btnCenterX), -(imageH/2 + space/2), titleCenterX-btnCenterX);
            self.imageEdgeInsets = UIEdgeInsetsMake(-(titleH/2 + space/2), btnCenterX-imageCenterX, titleH/2+ space/2, -(btnCenterX-imageCenterX));
        }
            break;
        case MMImageAlignmentLeft:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, space/2, 0,  -space/2);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space);
        }
            break;
        case MMImageAlignmentBottom:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(-(imageH/2+ space/2), -(titleCenterX-btnCenterX), imageH/2 + space/2, titleCenterX-btnCenterX);
            self.imageEdgeInsets = UIEdgeInsetsMake(titleH/2 + space/2, btnCenterX-imageCenterX,-(titleH/2+ space/2), -(btnCenterX-imageCenterX));
        }
            break;
        case MMImageAlignmentRight:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageW + space/2), 0, imageW + space/2);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleW+space/2, 0, -(titleW+space/2));
        }
            break;
        default:
            break;
    }
 
    
}

- (id)initWithType:(LZButtonType)buttonType position:(LZNavButtonPosition)position{
    CGRect frame;
    switch (position){
        case LZLeftNavFirst:
            frame = CGRectMake(0, 0, 45, YLNavigationBarH);
            break;
        case LZLeftNavSecond:
            frame = CGRectMake(50, 0, 45, YLNavigationBarH);
            break;
        case LZRightNavFirst:
            frame = CGRectMake(kScreenWidth - 45, 0, 45, YLNavigationBarH);
            break;
        case LZRightNavSecond:
            frame = CGRectMake(kScreenWidth - 90, 0, 45, YLNavigationBarH);
            break;
        default:
            frame = CGRectMake(0, 0, 45, YLNavigationBarH);
            break;
    }
    self = [super initWithFrame:frame];
    if(self){
        [self setTitleColor:RGBCOLOR(55, 55, 55)  forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self setType:buttonType];
    }
    return self;
}

- (void)setType:(LZButtonType)buttonType{
    switch (buttonType){
        case LZButtonBack:
            [self setETimage:[UIImage imageNamed:@"btn_fanhui"]];
            break;
        case LZButtonText:
            break;
        case LZButtonImage:
            break;
        default:
            break;
    }
}

- (void)setETimage:(UIImage *)etImage{
    [self setImage:etImage forState:UIControlStateNormal];
    [self setImage:etImage forState:UIControlStateHighlighted];
    [self setImage:etImage forState:UIControlStateSelected];
}

- (void)setTitle:(NSString *)title{
    if(title != __title){
        __title = title;
    }
    [self setTitle:__title forState:UIControlStateNormal];
    [self setTitle:__title forState:UIControlStateHighlighted];
    [self setTitle:__title forState:UIControlStateSelected];
}



@end
