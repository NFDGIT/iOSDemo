//
//  UITextField+MaxLimit.m
//  专卖商城 - iOS
//
//  Created by penghui on 2018/1/10.
//  Copyright © 2018年 重庆易耀通科技股份有限公司. All rights reserved.
//

#import "UITextField+MaxLimit.h"
static void *maxLimitKey = &maxLimitKey;
static void *lastOkValueKey = &lastOkValueKey;
static void *maxLimitBlockKey = &maxLimitBlockKey;

@interface UITextField()

@property (nonatomic,strong)NSString * lastOkValue;

@end

@implementation UITextField (MaxLimit)

/**
 maxLimit get  set方法
 */
- (NSUInteger)maxLimit{
    return [objc_getAssociatedObject(self, maxLimitKey) integerValue];
}
-  (void)setMaxLimit:(NSUInteger)maxLimit{
    objc_setAssociatedObject(self, maxLimitKey, @(maxLimit), OBJC_ASSOCIATION_RETAIN);
    [self addTarget:self action:@selector(change) forControlEvents:UIControlEventEditingChanged];
}
/**
 maxLimitBlock get  set方法
 */
- (void (^)())maxLimitBlock{
    return objc_getAssociatedObject(self, maxLimitBlockKey);
}
- (void)setMaxLimitBlock:(void (^)())maxLimitBlock{
    objc_setAssociatedObject(self, maxLimitBlockKey, maxLimitBlock, OBJC_ASSOCIATION_RETAIN);
}
/**
 lastOkValue get  set方法
 */
-(NSString*)lastOkValue{
    NSString * lastOkValue =objc_getAssociatedObject(self, lastOkValueKey);
    if (lastOkValue) {
        return lastOkValue;
    }
    return @"";
}
-(void)setLastOkValue:(NSString *)lastOkValue{
    objc_setAssociatedObject(self, lastOkValueKey, lastOkValue, OBJC_ASSOCIATION_RETAIN);
}
#pragma mark -- 
-(void)setMaxLimit:(NSUInteger)maxLimit beyoundBlock:(void (^)())block{
    self.maxLimit = maxLimit;
    self.maxLimitBlock = block;
}

#pragma mark -- changed
-(void)change{
    NSRange heightRange = [self selectedRange];
    // 高亮的文字
    NSString * hightText = [self.text substringWithRange:[self selectedRange]];
    // 非高亮的文字
    NSString * noHeightText =[NSString stringWithFormat:@"%@%@",[self.text substringToIndex:heightRange.location],[self.text substringFromIndex:heightRange.location+heightRange.length]];
    
    if ([self getToInt:noHeightText] > self.maxLimit) {
        self.text = self.lastOkValue;
        if (self.maxLimitBlock) {
            self.maxLimitBlock();
        }
    }else{
        self.lastOkValue = noHeightText;
    }
    
    NSLog(@"非高亮 ： %@  ： 高亮： %@",hightText,noHeightText);
}

// 获取选中 的文字区域
- (NSRange) selectedRange
{
    UITextPosition* beginning = self.beginningOfDocument;
    UITextRange* selectedRange =  [self markedTextRange];
    
    UITextPosition* selectionStart = selectedRange.start;
    UITextPosition* selectionEnd = selectedRange.end;
    
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    return NSMakeRange(location, length);
}
//得到中英文混合字符串长度
- (NSInteger)getToInt:(NSString*)strtemp
{
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* da = [strtemp dataUsingEncoding:enc];
    return [da length];
}

@end
