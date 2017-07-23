//
//  LaunchAdView.h
//  PHPackAge
//
//  Created by wdx on 16/9/5.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LaunchAdView : UIView
@property (nonatomic,strong)NSArray * adverS;
@property (nonatomic,assign)CGFloat margin;

+(instancetype)insWithMargin:(CGFloat)margin andDataS:(NSArray *)adverS;
@end
