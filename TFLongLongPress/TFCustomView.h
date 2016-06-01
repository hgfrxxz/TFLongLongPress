//
//  TFCustomView.h
//  TFLongLongPress
//
//  Created by taojunfeng on 16/6/1.
//  Copyright © 2016年 taojunfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFCustomView : UIView

@property (nonatomic, strong) UIImageView    *oneImageV;
@property (nonatomic, strong) UIImageView    *twoImageV;
@property (nonatomic, strong) UIImageView    *threeImageV;
@property (nonatomic, strong) UIImageView    *fourImageV;
@property (nonatomic, strong) UIImageView    *fiveImageV;
@property (nonatomic, strong) UIImageView    *sixImageV;

- (instancetype)initWithFrame:(CGRect)frame;
- (void)resetSubImagesWithImageArr:(NSArray *)imagesArr;

@end
