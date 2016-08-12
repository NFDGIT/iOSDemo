//
//  SuperViewController.m
//  PHPackAge
//
//  Created by wdx on 16/8/11.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "SuperViewController.h"

@interface SuperViewController ()

@end

@implementation SuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
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
-(UILabel *)getDeleteLineWithLabel:(UILabel *)label{
    
    NSMutableAttributedString * attributeString=[[NSMutableAttributedString alloc]initWithAttributedString:label.attributedText];
    
    NSNumber *nuber = [[NSNumber alloc]initWithLong:(NSUnderlinePatternSolid |NSUnderlineStyleSingle)];
    [attributeString addAttribute:NSStrikethroughStyleAttributeName value:nuber range:NSMakeRange(0, label.text.length)];
    label.attributedText=attributeString;
    return label;
}
-(UILabel *)changeLabel:(UILabel *)label ParagraphSpace:(CGFloat )space{
    NSMutableAttributedString * attributeString=[[NSMutableAttributedString alloc]initWithAttributedString:label.attributedText];
    NSMutableParagraphStyle * style=[[NSMutableParagraphStyle alloc]init];
    style.paragraphSpacing=space;
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, label.text.length)];
    label.attributedText=attributeString;
    return label;
}

-(CGSize)Text:(NSString *)text Size:(CGSize)size Font:(CGFloat)fone{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fone], NSParagraphStyleAttributeName:paragraphStyle.copy};
    return   [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}
-(void)showPromptBoxWithSting:(NSString *)prompt{
    UILabel * noticeLabel=[[UILabel alloc]init];
    noticeLabel.text=prompt;
    noticeLabel.font=[UIFont systemFontOfSize:13*self.view.scale];
    noticeLabel.size=[self Text:prompt Size:CGSizeMake(sWidth/2, 2000) Font:13*self.view.scale];
    noticeLabel.height=noticeLabel.height+20*self.view.scale;
    noticeLabel.width=noticeLabel.width+20*self.view.scale;
    noticeLabel.numberOfLines=0;
    noticeLabel.layer.cornerRadius=5*self.view.scale;
    noticeLabel.layer.masksToBounds=YES;
    noticeLabel.textAlignment=NSTextAlignmentCenter;
    //    noticeLabel.alpha=0.8;
    noticeLabel.backgroundColor=[UIColor grayColor];
    
    noticeLabel.center=self.view.center;
    [self.view addSubview:noticeLabel];
    [UIView animateWithDuration:0.5 delay:1 options:UIViewAnimationOptionTransitionNone animations:^{
        noticeLabel.alpha=0;
    } completion:^(BOOL finished) {
        [noticeLabel removeFromSuperview];
    }];
}
-(void)showAlertWithTitle:(NSString *)title content:(NSString *)content{
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:title message:content preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action1=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action1];
    [self presentViewController:alert animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
