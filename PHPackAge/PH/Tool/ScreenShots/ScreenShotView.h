//
//  ScreenShotView.h
//  PHPackAge
//
//  Created by wdx on 16/8/24.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHDefine.h"
typedef NS_ENUM(NSInteger,MarqueeType){
    MarqueeTypeRect =0,
    MarqueeTypeRound =1
};

@interface ScreenShotView : UIView
@property (nonatomic,assign)CGFloat marqueeW;
@property (nonatomic,assign)MarqueeType marqueeType;
@property (nonatomic,strong)UIImage * originImage;

@property (nonatomic,strong)void (^block)(UIImage * resultImg);
@end
