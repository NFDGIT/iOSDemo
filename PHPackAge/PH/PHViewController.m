//
//  ViewController.m
//  PHJD
//
//  Created by wdx on 16/7/6.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "PHViewController.h"
#import "PHDefine.h"

@interface PHViewController ()

@end

@implementation PHViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
}

#pragma  mark   --   属性文本
//获得 含有彩色文字的 UILabel
-(UILabel *)getColorLabel:(UILabel *)label stringAndColor:(NSDictionary *)dict{
    
    NSMutableAttributedString * attributeString=[[NSMutableAttributedString alloc]initWithAttributedString:label.attributedText];
    for (NSString * key in dict.allKeys) {
        if (key) {
            if ([[dict valueForKey:key] isKindOfClass:[UIColor class]]) {
                NSRange  range=[label.text rangeOfString:key];
                [attributeString addAttribute:NSForegroundColorAttributeName value:(UIColor *)[dict valueForKey:key] range:range];
            }
        }
    }
    label.attributedText=attributeString;
    return label;
}


-(CGSize)Text:(NSString *)text Size:(CGSize)size Font:(CGFloat)fone{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fone], NSParagraphStyleAttributeName:paragraphStyle.copy};
    return   [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}
-(void)showNoticeWithSting:(NSString *)notice{
    UILabel * noticeLabel=[[UILabel alloc]init];
    noticeLabel.text=notice;
    noticeLabel.font=[UIFont systemFontOfSize:13*self.view.scale];
    noticeLabel.size=[self Text:notice Size:CGSizeMake(Swidth/2, 2000) Font:13*self.view.scale];
    noticeLabel.height=noticeLabel.height+20*self.view.scale;
    noticeLabel.width=noticeLabel.width+20*self.view.scale;
    noticeLabel.textAlignment=NSTextAlignmentCenter;
    
    noticeLabel.backgroundColor=[UIColor grayColor];
    
    noticeLabel.center=self.view.center;
    [self.view addSubview:noticeLabel];
    [UIView animateWithDuration:0.5 delay:2 options:UIViewAnimationOptionTransitionNone animations:^{
        noticeLabel.alpha=0;
    } completion:^(BOOL finished) {
        [noticeLabel removeFromSuperview];
    }];
}

@end
