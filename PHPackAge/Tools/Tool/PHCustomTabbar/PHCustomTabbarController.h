//
//  PHCustomTabbar.h
//  PHPackAge
//
//  Created by MIAO on 2017/4/24.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PHTabbarButton : UIButton
@property (nonatomic,strong)UIViewController  * controller;
+(instancetype)insWithController:(UIViewController *)controller;
@end






@interface PHCustomTabbarController : UITabBarController
+(instancetype)insWithButtons:(NSArray <PHTabbarButton *>*)buttons;
-(void)replaceButtonOfindex:(NSInteger)index withButton:(PHTabbarButton *)button;
@property (nonatomic,strong)void (^block)(NSInteger index);
@end
