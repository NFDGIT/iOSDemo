//
//  PHPopBox.h
//  QQRunning
//
//  Created by wdx on 2017/3/3.
//  Copyright © 2017年 软盟. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#pragma mark -- btn 结构体
@interface ControlStyle : NSObject
@property (nonatomic,strong)NSString * title;
@property (nonatomic,strong)UIColor  * color;
+(instancetype)insWithTitle:(NSString *)title andColor:(UIColor *)color;
@end


#pragma mark -- main interface
typedef NS_ENUM(NSInteger,BoxType) { /// 根据 具体项目 设定 相应的类型
    boxType1,
    boxType2,
    boxType3,
    boxType4,
    boxType5,
    boxType6,
};
typedef void(^AlertBlock)(NSInteger index);
@interface PHPopBox : UIControl

+(void)showAlertWithTitle:(NSString *)title message:(NSString *)message boxType:(BoxType)boxType buttons:(NSArray<ControlStyle *> *)buttons block:(AlertBlock)block;
+(void)showSheetWithButtonStyles:(NSArray<ControlStyle*>*)styles block:(AlertBlock)block;

+(void)startLoadDataWithTitle:(NSString *)title;
-(void)disMiss;
@end




