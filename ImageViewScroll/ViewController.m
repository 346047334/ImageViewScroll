//
//  ViewController.m
//  ImageViewScroll
//
//  Created by 方常伟 on 16/8/2.
//  Copyright © 2016年 方常伟. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewsScroll.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    NSArray * arr = @[@"0",@"1",@"2",@"3",@"4",];
    ImageViewsScroll * imageView = [[ImageViewsScroll alloc]initWithArray:arr];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
