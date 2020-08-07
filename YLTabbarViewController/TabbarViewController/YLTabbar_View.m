//
//  YLTabbar_View.m
//  YLTabbarViewController
//
//  Created by mac on 2020/6/30.
//  Copyright © 2020 fanyoule. All rights reserved.
//

#import "YLTabbar_View.h"
#define K_WIDTH_YL  [UIScreen mainScreen].bounds.size.width
#define ITEMTAG 1000
#define BADGETAG 10086
#define RADIUS 15
@interface YLTabbar_View()<CAAnimationDelegate>
{
    UIBezierPath * animationPath;
    CAShapeLayer * shapeLayer;
    NSInteger count;
   
}
@end

@implementation YLTabbar_View
-(instancetype)initWithFrame:(CGRect)frame Titles:(NSArray<NSString *> *)titles itemImages:(NSArray *)itemImgs selectImages :(NSArray *)selectImages withTitleColor:(UIColor *)def_color withTitleSelectColor:(UIColor *)sel_color{
    
     if (self = [super initWithFrame:frame]) {
   
        animationPath = [[UIBezierPath alloc]init];
        shapeLayer = [CAShapeLayer layer];
        _titles = titles;
        _itemImages = itemImgs;
        _defColor = def_color;
        _tintColor = sel_color;
        _selectItemImages = selectImages;
        _selectIndex = 0;
        [self addItems];
        
    }
    return self;
}
-(void)addItems{
    //取最小的count 防止越界
    count = _itemImages.count<_selectItemImages.count?_itemImages.count:_selectItemImages.count;
    count = count<_titles.count?count:_titles.count;
    _tabBarItems = [NSMutableArray arrayWithCapacity:count];
    
    for (int i=0; i<count; i++) {
        YLTabbarItem_View * item = [[YLTabbarItem_View alloc]initWithTitle:_titles[i] withFont:[UIFont systemFontOfSize:12] withTitleColor:_defColor withTitleSelectColor:_tintColor withNormalImageNamen:_itemImages[i] withSelectedImageName:_selectItemImages[i]];
        item.frame = CGRectMake(i*K_WIDTH_YL/count, 0, K_WIDTH_YL/count, 49);
        item.tag = ITEMTAG + i;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectItem:)];
        [item addGestureRecognizer:tap];
        [self addSubview:item];
        if (i == 0) {
            item.is_selected = YES;
            self.selectIndex = 0;
            _tabbarItem = item;
        }
        [_tabBarItems addObject:item];
    }
   
}

-(void)selectItem:(UITapGestureRecognizer *)tap{
    
    YLTabbarItem_View * item =(YLTabbarItem_View *) tap.view;
    if (item == _tabbarItem) {
        return;
    }
    self.selectIndex = item.tag - ITEMTAG;
  
}
-(void)setSelectIndex:(NSInteger)selectIndex{
    
    if (_selectIndex == selectIndex) {
        return;
    }
    if (selectIndex>_tabBarItems.count) {
        return;
    }
    _selectIndex = selectIndex;
    _tabbarItem.is_selected = NO;
    _tabbarItem = _tabBarItems[selectIndex];
    _tabbarItem.is_selected = YES;
    
    
    if (self.delegate) {
        [self.delegate YLTabbar_selectedIndex:selectIndex];
    }
    
    
    
    
    
}
/**
 *1、init初始化不会触发layoutSubviews
 2、addSubview会触发layoutSubviews
 3、设置view的Frame会触发layoutSubviews，当然前提是frame的值设置前后发生了变化
 4、滚动一个UIScrollView会触发layoutSubviews
 5、旋转Screen会触发父UIView上的layoutSubviews事件
 6、改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件
 **/
- (void)layoutSubviews{
    [super layoutSubviews];
    self.backgroundColor = [UIColor whiteColor];
}







@end
