//
//  PHSegmentViewController.h
//  PuJiYC
//
//  Created by penghui on 2018/1/30.
//  Copyright © 2018年 penghui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHTabbarView.h"

@interface PHSegmentViewController : UIViewController
@property (nonatomic,strong)NSMutableArray * controllers;

@property (nonatomic,strong)UIButton * leftBtn;
@property (nonatomic,strong)UIButton * rightBtn;

@property (nonatomic,assign)PHTabbarType tabbarViewType;
@property (nonatomic,assign)UIPageViewControllerTransitionStyle transitionStyle;
@property (nonatomic,assign)UIFont * titleFont;
@property (nonatomic,assign)CGFloat   titleViewHeight;
@property (nonatomic,strong)UIColor * titleColor;


/**
 判断 content 如果为 tableiview 或者 collectView  能否滚动
 */
-(void)judgeContentWhetherScroll;
@end


