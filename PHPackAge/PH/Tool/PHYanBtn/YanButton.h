//
//  YanButton.h
//  PHPackAge
//
//  Created by wdx on 2017/1/11.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YanButton : UIButton
+(YanButton *)insButtonWithFrame:(CGRect )frame title:(NSString *)title time:(NSInteger)time;
-(void)startTimer;
@end
