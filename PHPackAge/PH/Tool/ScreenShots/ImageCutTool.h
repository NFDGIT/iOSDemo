//
//  ImageCutTool.h
//  PHPackAge
//
//  Created by wdx on 16/8/26.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "SuperViewController.h"
#import "PHDefine.h"
typedef NS_ENUM(NSInteger,MarqueeType){
    MarqueeTypeRect =0,
    MarqueeTypeRound =1
};
@interface ImageCutTool : SuperViewController
@property (nonatomic,assign)CGFloat marqueeW;
@property (nonatomic,assign)MarqueeType marqueeType;
@property (nonatomic,strong)UIImage * originImage;

@property (nonatomic,strong)void (^block)(UIImage * resultImg);
@end
