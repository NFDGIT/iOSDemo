//
//  UILabel+Helper.m
//  PHPackAge
//
//  Created by wdx on 16/8/29.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "UILabel+Helper.h"
//#import <UIKit/UIKit.h>

@implementation UILabel (Helper)
//根据 内容获取 显示控件的大小
+(CGSize)Text:(NSString *)text Size:(CGSize)size Font:(CGFloat)fone{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fone], NSParagraphStyleAttributeName:paragraphStyle.copy};
    return   [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}


@end
