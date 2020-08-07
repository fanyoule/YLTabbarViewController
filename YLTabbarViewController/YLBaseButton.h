//
//  YLBaseButton.h
//  DHMall
//
//  Created by mac on 2019/9/17.
//  Copyright © 2019 fanyoule. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 *  按钮中图片的位置
 */
typedef NS_ENUM(NSUInteger,MMImageAlignment) {
    /**
     *  图片在左，默认
     */
    MMImageAlignmentLeft = 0,
    /**
     *  图片在上
     */
    MMImageAlignmentTop,
    /**
     *  图片在下
     */
    MMImageAlignmentBottom,
    /**
     *  图片在右
     */
    MMImageAlignmentRight
};
typedef NS_ENUM(NSUInteger,LZButtonType) {
    LZButtonBack,       //返回按钮
    LZButtonText,       //文字类型按钮
    LZButtonImage       //图片类型按钮
    
};

typedef NS_ENUM(NSInteger, LZNavButtonPosition){
    LZLeftNavFirst = 0,                             //左半边靠边按钮
    LZLeftNavSecond,                                //左半边靠里按钮
    LZRightNavFirst,                                //右半边靠边按钮
    LZRightNavSecond,                               //右半边靠里按钮
};


@interface YLBaseButton : UIButton

/**
 *  按钮中图片的位置
 */
@property(nonatomic,assign)MMImageAlignment imageAlignment;

/**
 *  按钮中图片与文字的间距
 */
@property(nonatomic,assign)CGFloat spaceBetweenTitleAndImage;

@property (nonatomic,strong,setter = setTitle:) NSString *__title;
/**
 *  初始化button格式
 *
 *  @param buttonType buttonType 传入需要初始化的button类型
 *  @param position   navButton的位置
 */
-(id)initWithType:(LZButtonType)buttonType position:(LZNavButtonPosition)position;
/**
设置button格式

@param buttonType 按钮类型
*/
- (void)setType:(LZButtonType)buttonType;
/**
 *  为了设置主题皮肤，用于设置button图片
 *
 *  @param etImage 传入 UIImage
 */
- (void)setETimage:(UIImage *)etImage;





@end

NS_ASSUME_NONNULL_END
