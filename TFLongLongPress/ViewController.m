//
//  ViewController.m
//  TFLongLongPress
//
//  Created by taojunfeng on 16/6/1.
//  Copyright © 2016年 taojunfeng. All rights reserved.
//

#define SCREEN_Width [UIScreen mainScreen].bounds.size.width

#import "ViewController.h"
#import "TFCustomView.h"

@interface ViewController ()

@property (strong,nonatomic) NSMutableArray *imagesUrlArr;

@end

@implementation ViewController
{
    TFCustomView    *imgsView;
    NSArray         *frameArray;
    CGPoint         startCenterPoint;
    CGPoint         endCenterPoint;
    CGPoint         startMovePoint;
    CGRect          startFrame;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _imagesUrlArr = [@[[UIImage imageNamed:@"22.jpg"],[UIImage imageNamed:@"33.jpg"],[UIImage imageNamed:@"秀场.png"],[UIImage imageNamed:@"price_59"],[UIImage imageNamed:@"price_79"],[UIImage imageNamed:@"price_39"]] mutableCopy];
    imgsView = [[TFCustomView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Width)];
    [imgsView resetSubImagesWithImageArr:_imagesUrlArr];
    [self.view addSubview:imgsView];
    NSValue *rect1 = [NSValue valueWithCGRect:CGRectMake(0, 0, SCREEN_Width/3, SCREEN_Width/2)];
    NSValue *rect2 = [NSValue valueWithCGRect:CGRectMake(SCREEN_Width/3, 0, SCREEN_Width/3, SCREEN_Width/2)];
    NSValue *rect3 = [NSValue valueWithCGRect:CGRectMake(SCREEN_Width*2/3, 0, SCREEN_Width/3, SCREEN_Width/2)];
    NSValue *rect4 = [NSValue valueWithCGRect:CGRectMake(0, SCREEN_Width/2, SCREEN_Width/3, SCREEN_Width/2)];
    NSValue *rect5 = [NSValue valueWithCGRect:CGRectMake(SCREEN_Width/3, SCREEN_Width/2, SCREEN_Width/3, SCREEN_Width/2)];
    NSValue *rect6 = [NSValue valueWithCGRect:CGRectMake(SCREEN_Width*2/3, SCREEN_Width/2, SCREEN_Width/3, SCREEN_Width/2)];
    
    frameArray = [[NSArray alloc] initWithObjects:rect1,rect2,rect3,rect4,rect5,rect6, nil];
    [self resetImageViewTap];
}

- (void)resetImageViewTap {
    for (UIImageView *img in imgsView.subviews) {
        if ([img isKindOfClass:[UIImageView class]]) {
            UILongPressGestureRecognizer *pressLong = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
            [img addGestureRecognizer:pressLong];
        }
    }
}

#pragma mark - event response
- (void)longPress:(UILongPressGestureRecognizer *)sender {
    UIImageView *recogn = (UIImageView *)sender.view;
    CGPoint recognizerPoint = [sender locationInView:imgsView];
    if (sender.state == UIGestureRecognizerStateBegan) {
        startCenterPoint = recogn.center;
        startFrame = [[frameArray objectAtIndex:(sender.view.tag - 10)] CGRectValue];
        startMovePoint = recognizerPoint;
        [UIView animateWithDuration:0.2 animations:^{
            recogn.transform = CGAffineTransformMakeScale(1.3, 1.3);
            recogn.alpha = 0.7;
        }];
        [imgsView bringSubviewToFront:recogn];
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        CGPoint movePoint = CGPointMake(recognizerPoint.x - startMovePoint.x, recognizerPoint.y - startMovePoint.y);
        startMovePoint = recognizerPoint;
        recogn.center = CGPointMake(recogn.center.x + movePoint.x, recogn.center.y + movePoint.y);
        endCenterPoint = recogn.center;
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.2 animations:^{
            recogn.transform = CGAffineTransformMakeScale(1, 1);
            recogn.alpha = 1;
        }];
        NSInteger imgTag = 10;
        BOOL move = NO;
        if (!CGPointEqualToPoint(CGPointZero, endCenterPoint)) {
            for (NSInteger i = 0; i< 6; i++) {
                if (CGRectContainsPoint([[frameArray objectAtIndex:i] CGRectValue], endCenterPoint)) {
                    CGFloat moveX = fabs(endCenterPoint.x - startCenterPoint.x) - startFrame.size.width/2;
                    CGFloat moveY = fabs(endCenterPoint.y - startCenterPoint.y) - startFrame.size.height/2;
                    if (moveX >= 0 || moveY >= 0) {
                        imgTag += i;
                        UIImageView *other = [imgsView viewWithTag:imgTag];
                        CGRect endFrame = other.frame;
                        other.frame = startFrame;
                        recogn.frame = endFrame;
                        other.tag = recogn.tag;
                        recogn.tag = imgTag;
                        [_imagesUrlArr exchangeObjectAtIndex:recogn.tag-10 withObjectAtIndex:imgTag-10];
                        move = YES;
                    }
                }
            }
        }
        if (!move) {
            recogn.frame = startFrame;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
