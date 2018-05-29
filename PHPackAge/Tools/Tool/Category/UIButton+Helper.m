//
//  UIButton+Helper.m
//  PHPackAge
//
//  Created by wdx on 2016/12/28.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "UIButton+Helper.h"
#import <objc/runtime.h>

@interface UIButton()
@property (nonatomic,strong)void(^eventBlock)(UIButton * target);
@end
@implementation UIButton (Helper)

static void *eventBlockKey = &eventBlockKey;
/**
 maxLimitBlock get  set方法
 */
- (void (^)(UIButton * target))eventBlock{
    return objc_getAssociatedObject(self, eventBlockKey);
}
- (void)setEventBlock:(void (^)(UIButton * target))eventBlock{
    objc_setAssociatedObject(self, eventBlockKey, eventBlock, OBJC_ASSOCIATION_RETAIN);
}


-(void)addEvents:(UIControlEvents)event block:(void (^)(UIButton * target))block
{
    [self addTarget:self action:@selector(click:) forControlEvents:event];
    self.eventBlock = block;
}
-(void)click:(UIButton *)sender{
    self.eventBlock(sender);
}

@end
