//
//  TFCustomView.m
//  TFLongLongPress
//
//  Created by taojunfeng on 16/6/1.
//  Copyright © 2016年 taojunfeng. All rights reserved.
//

#import "TFCustomView.h"

@implementation TFCustomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.oneImageV];
        [self addSubview:self.twoImageV];
        [self addSubview:self.threeImageV];
        [self addSubview:self.fourImageV];
        [self addSubview:self.fiveImageV];
        [self addSubview:self.sixImageV];
        [self layoutPageSubviewsWith:frame];
    }
    return self;
}

- (void)layoutPageSubviewsWith:(CGRect)frame {
    _oneImageV.frame = CGRectMake(0, 0, frame.size.width/3,  frame.size.height/2);
    _twoImageV.frame = CGRectMake(frame.size.width/3, 0, frame.size.width/3, frame.size.height/2);
    _threeImageV.frame = CGRectMake(frame.size.width*2/3, 0, frame.size.width/3, frame.size.height/2);
    _fourImageV.frame = CGRectMake(0, frame.size.width/2, frame.size.width/3, frame.size.height/2);
    _fiveImageV.frame = CGRectMake(frame.size.width/3, frame.size.width/2, frame.size.width/3, frame.size.height/2);
    _sixImageV.frame = CGRectMake(frame.size.width*2/3, frame.size.width/2, frame.size.width/3, frame.size.height/2);
}

- (void)resetSubImagesWithImageArr:(NSArray *)imagesArr {
    UIImageView *imageOne = [self viewWithTag:10];
    UIImageView *imagetwo = [self viewWithTag:11];
    UIImageView *imageThree = [self viewWithTag:12];
    UIImageView *imageFour = [self viewWithTag:13];
    UIImageView *imageFive = [self viewWithTag:14];
    UIImageView *imageSix = [self viewWithTag:15];
    if (imagesArr.count > 0) {
        imageOne.image = imagesArr[1];
        imagetwo.image = imagesArr[2];
        imageThree.image = imagesArr[3];
        imageFour.image = imagesArr[4];
        imageFive.image = imagesArr[5];
        imageSix.image = imagesArr[0];
    }
}

#pragma mark - setter and getter
- (UIImageView *)oneImageV {
    if (!_oneImageV) {
        _oneImageV = [[UIImageView alloc] init];
        _oneImageV.tag = 10;
        _oneImageV.userInteractionEnabled = YES;
    }
    return _oneImageV;
}

- (UIImageView *)twoImageV {
    if (!_twoImageV) {
        _twoImageV = [[UIImageView alloc] init];
        _twoImageV.tag = 11;
        _twoImageV.userInteractionEnabled = YES;
    }
    return _twoImageV;
}

- (UIImageView *)threeImageV {
    if (!_threeImageV) {
        _threeImageV = [[UIImageView alloc] init];
        _threeImageV.tag = 12;
        _threeImageV.userInteractionEnabled = YES;
    }
    return _threeImageV;
}

- (UIImageView *)fourImageV {
    if (!_fourImageV) {
        _fourImageV = [[UIImageView alloc] init];
        _fourImageV.tag = 13;
        _fourImageV.userInteractionEnabled = YES;
    }
    return _fourImageV;
}

- (UIImageView *)fiveImageV {
    if (!_fiveImageV) {
        _fiveImageV = [[UIImageView alloc] init];
        _fiveImageV.tag = 14;
        _fiveImageV.userInteractionEnabled = YES;
    }
    return _fiveImageV;
}

- (UIImageView *)sixImageV {
    if (!_sixImageV) {
        _sixImageV = [[UIImageView alloc] init];
        _sixImageV.tag = 15;
        _sixImageV.userInteractionEnabled = YES;
    }
    return _sixImageV;
}
@end
