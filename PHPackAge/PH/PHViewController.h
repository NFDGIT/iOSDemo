//
//  ViewController.h
//  PHJD
//
//  Created by wdx on 16/7/6.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHDefine.h"
@interface PHViewController : UIViewController


#pragma  mark   --   属性文本
/*
*获得 含有彩色文字的 UILabel
*/
-(UILabel *)getColorLabel:(UILabel *)label stringAndColor:(NSDictionary *)dict;
/*
 *获得下划线
 */
-(UILabel *)getDeleteLineWithLabel:(UILabel *)label;
/*
*获得 文本view 的大小
*/
 -(CGSize)Text:(NSString *)text Size:(CGSize)size Font:(CGFloat)fone;

/*
*显示 提示 框
*/
-(void)showAlertWithTitle:(NSString *)title content:(NSString *)content;
-(void)showPromptBoxWithSting:(NSString *)prompt;
@end
