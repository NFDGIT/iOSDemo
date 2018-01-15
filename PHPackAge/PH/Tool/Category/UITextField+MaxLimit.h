//
//  UITextField+MaxLimit.h
//  专卖商城 - iOS
//
//  Created by penghui on 2018/1/10.
//  Copyright © 2018年 重庆易耀通科技股份有限公司. All rights reserved.
//



@interface UITextField (MaxLimit)
/**
 最大能输入 多少字
 */
@property (nonatomic,assign)NSUInteger maxLimit;
/**
 超出最大限制的回调
 */
@property (nonatomic,strong)void(^maxLimitBlock)();
-(void)setMaxLimit:(NSUInteger)maxLimit beyoundBlock:(void(^)())block;
@end
