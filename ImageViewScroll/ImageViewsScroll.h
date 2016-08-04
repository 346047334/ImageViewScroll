//
//  ImageViewsScroll.h
//  ImageViewScroll
//
//  Created by 方常伟 on 16/8/2.
//  Copyright © 2016年 方常伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewsScroll : UIImageView

@property(nonatomic,assign)NSInteger currentIndex;
@property(nonatomic,copy)NSArray * dataArray;
-(instancetype)initWithArray:(NSArray*)imageArray;
@end
