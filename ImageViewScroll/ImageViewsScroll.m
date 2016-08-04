//
//  ImageViewsScroll.m
//  ImageViewScroll
//
//  Created by 方常伟 on 16/8/2.
//  Copyright © 2016年 方常伟. All rights reserved.
//

#import "ImageViewsScroll.h"

@implementation ImageViewsScroll
-(instancetype)initWithArray:(NSArray*)imageArray{
    if ([super initWithFrame:[UIScreen mainScreen].bounds]) {
        _dataArray = [NSArray array];
        _dataArray  = imageArray;
        self.image = [UIImage imageNamed:_dataArray[0]];
        self.contentMode = UIViewContentModeScaleAspectFit;
        self.userInteractionEnabled = YES;
        //添加手势
        UISwipeGestureRecognizer *leftSwipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipe:)];
        leftSwipeGesture.direction=UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:leftSwipeGesture];
        
        UISwipeGestureRecognizer *rightSwipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipe:)];
        rightSwipeGesture.direction=UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer:rightSwipeGesture];
    }
    return self;
}
#pragma mark 向左滑动浏览下一张图片
-(void)leftSwipe:(UISwipeGestureRecognizer *)gesture{
    [self transitionAnimation:YES];
}

#pragma mark 向右滑动浏览上一张图片
-(void)rightSwipe:(UISwipeGestureRecognizer *)gesture{
    [self transitionAnimation:NO];
}


#pragma mark 转场动画
-(void)transitionAnimation:(BOOL)isNext{
    //1.创建转场动画对象
    CATransition *transition=[[CATransition alloc]init];
    
    //2.设置动画类型,注意对于苹果官方没公开的动画类型只能使用字符串，并没有对应的常量定义
//    transition.type=@"cube";
        transition.type = kCATransitionPush;
    //设置子类型
    if (isNext) {
        transition.subtype=kCATransitionFromRight;
    }else{
        transition.subtype=kCATransitionFromLeft;
    }
    //设置动画时常
    transition.duration=1.0f;
    
    //3.设置转场后的新视图添加转场动画
    self.image=[self getImage:isNext];
    [self.layer addAnimation:transition forKey:@"KCTransitionAnimation"];
}
#pragma mark 取得当前图片
-(UIImage *)getImage:(BOOL)isNext{
    if (isNext) {
        _currentIndex=(_currentIndex+1)%_dataArray.count;
    }else{
        _currentIndex=(_currentIndex-1+_dataArray.count)%_dataArray.count;
    }
    
    NSString *imageName=_dataArray[_currentIndex];
    return [UIImage imageNamed:imageName];
}
@end
