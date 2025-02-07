//
//  UIViewController+Category.m
//  ChongFa
//
//  Created by bilin on 16/10/26.
//  Copyright © 2016年 lixueliang. All rights reserved.
//

#import "UIViewController+Category.h"
#import <objc/runtime.h>
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

@implementation UIViewController (Category)
+ (void)load {
    
    //我们只有在开发的时候才需要查看哪个viewController将出现
    //所以在release模式下就没必要进行方法的交换
#ifdef DEBUG
    
    //原本的viewWillAppear方法
    Method viewWillAppear = class_getInstanceMethod(self, @selector(viewWillAppear:));
    
    //需要替换成 能够输出日志的viewWillAppear
    Method logViewWillAppear = class_getInstanceMethod(self, @selector(logViewWillAppear:));
    
    //两方法进行交换
    method_exchangeImplementations(viewWillAppear, logViewWillAppear);
    
#endif
    //原本的viewDidLoad方法
    Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
    
    //需要替换成 swizzling_viewDidLoad
    Method swizzling_viewDidLoad = class_getInstanceMethod(self, @selector(swizzling_viewDidLoad));
    //两方法进行交换
    method_exchangeImplementations(viewDidLoad, swizzling_viewDidLoad);

}
- (void)swizzling_viewDidLoad{
    if (self.navigationController) {
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backItem;
    }
    [self swizzling_viewDidLoad];
}

- (void)logViewWillAppear:(BOOL)animated {
    
    NSString *className = NSStringFromClass([self class]);
    
    //在这里，你可以进行过滤操作，指定哪些viewController需要打印，哪些不需要打印
    if ([className hasPrefix:@"UI"] == NO) {
        DLog(@"%@ will appear",className);
    }
    
    
    //下面方法的调用，其实是调用viewWillAppear
    [self logViewWillAppear:animated];
}

@end
