//
//  PHDefine.h
//  PHJD
//
//  Created by wdx on 16/7/6.
//  Copyright © 2016年 wdx. All rights reserved.
//

#ifndef PHDefine_h
#define PHDefine_h
#import "UIImage+Helper.h"
#import "UIViewAdditions.h"
#import "Masonry.h"


#pragma mark -- Color
/*
 *定义的所有的颜色
 */
#define colorPinkRed [UIColor colorWithRed:237/255.0 green:72/255.0 blue:140/255.0 alpha:0.7]
#define colorSuperBackground [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1]
#define colortabBarBackGround [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1]
#define colorNavigationController [UIColor colorWithRed:0 green:147/255.0 blue:249/255.0 alpha:1]
#define colorText [UIColor colorWithRed:131/255.0 green:92/255.0 blue:218/255.0 alpha:1]
#define colorWhiteLine [UIColor whiteColor]
#define colorGrayText [UIColor colorWithRed:113/255.0 green:113/255.0 blue:113/255.0 alpha:1]
#define colorBlackText [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]
#define colorBlackLine [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1]
#define colorButtonBlack [UIColor colorWithRed:36/255.0 green:76/255.0 blue:129/255.0 alpha:1]
#define colorButtonHigthed [UIColor colorWithRed:255/255.0 green:80/255.0 blue:0/255.0 alpha:1]
#define colorBlueText [UIColor colorWithRed:0/255.0 green:134/255.0 blue:237/255.0 alpha:1]
#define colorDefaultBlackText [UIColor colorWithRed:0 green:0 blue:0 alpha:.7]

#pragma mark -- font
/*
 * 定义的所有的字体 大小
 */
#define fontDefault(__scale) [UIFont systemFontOfSize:13*__scale]

#define fontSmall(__scale) [UIFont systemFontOfSize:12*__scale]
#define fontSmall11(__scale) [UIFont systemFontOfSize:11*__scale]
#define fontSmall10(__scale) [UIFont systemFontOfSize:10*__scale]
#define fontBoldSmall(__scale) [UIFont fontWithName:@"Helvetica-Bold" size:12*__scale]
#define fontBoldSmall11(__scale) [UIFont fontWithName:@"Helvetica-Bold" size:11*__scale]
#define fontBoldSmall10(__scale) [UIFont fontWithName:@"Helvetica-Bold" size:10*__scale]

#define fontBig14(__scale) [UIFont systemFontOfSize:14*__scale]
#define fontBig15(__scale) [UIFont systemFontOfSize:15*__scale]
#define fontBig16(__scale) [UIFont systemFontOfSize:16*__scale]
#define fontBig17(__scale) [UIFont systemFontOfSize:17*__scale]
#define fontMaxBig(__scale) [UIFont systemFontOfSize:18*__scale]
#define fontBig14Bold(__scale) [UIFont fontWithName:@"Helvetica-Bold" size:14*__scale]
#define fontBig15Bold(__scale) [UIFont fontWithName:@"Helvetica-Bold" size:15*__scale]
#define fontBig16Bold(__scale) [UIFont fontWithName:@"Helvetica-Bold" size:16*__scale]
#define fontBig17Bold(__scale) [UIFont fontWithName:@"Helvetica-Bold" size:17*__scale]
#define fontMaxBigBold(__scale) [UIFont fontWithName:@"Helvetica-Bold" size:18*__scale]


#pragma mark -- 屏幕尺寸
#define Vwidth     [UIScreen mainScreen].bounds.size.width
#define Vheight    [UIScreen mainScreen].bounds.size.height





#endif /* PHDefine_h */
