//
//  UIView+Helper.m
//  PHPackAge
//
//  Created by wdx on 2016/12/28.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "UIView+Helper.h"
#import "UIViewAdditions.h"
#import "UILabel+Helper.h"


@implementation UIView (Helper)
/*
 *创建一个跑马灯
*/

-(UIView *)createMarqueeWithFrame:(CGRect)frame text:(NSString *)string{
    UIView * bgView=[[UILabel alloc]initWithFrame:frame];
    bgView.backgroundColor=[UIColor lightGrayColor];
    bgView.layer.masksToBounds=YES;
    UILabel * label= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width , frame.size.height)];
    [bgView addSubview:label];
    label.numberOfLines=1;
    label.font=[UIFont systemFontOfSize:13];
    label.textColor=[UIColor blackColor];
    label.text=[NSString stringWithFormat:@" %@ ",string];
    label.textAlignment=NSTextAlignmentCenter;
    CGFloat w=[UILabel Text:label.text Size:CGSizeMake(2000, frame.size.height) Font:13].width;
    if (w>frame.size.width) {
        NSString * stringD=[label.text stringByAppendingString:label.text];
        label.width=w*2;
        label.text=stringD;
        [UIView animateWithDuration:string.length/4 delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionRepeat animations:^{
            label.transform=CGAffineTransformMakeTranslation(-w, 0);
        } completion:^(BOOL finished) {
            label.left=0;
        }];
    }
    return bgView;
}
@end
