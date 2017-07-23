//
//  PHPopBox.m
//  QQRunning
//
//  Created by wdx on 2017/3/3.
//  Copyright © 2017年 软盟. All rights reserved.
//

#import "PHPopBox.h"
#import "UIViewAdditions.h"
#import "UIImage+Helper.h"

#pragma  mark -- btnStyle
@implementation ControlStyle
+(instancetype)insWithTitle:(NSString *)title andColor:(UIColor *)color{
    ControlStyle * style = [ControlStyle new];
    style.title=title;
    style.color=color;
    return style;
}

@end

#pragma mark -- main Interface
@interface PHPopBox()
@property (nonatomic,strong)AlertBlock alertBlock;

@property (nonatomic,strong)UIView * BgView;
@end
@implementation PHPopBox
-(instancetype)init{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    
    self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    return self;
}


+(void)showAlertWithTitle:(NSString *)title message:(NSString *)message boxType:(BoxType)boxType buttons:(NSArray<ControlStyle *> *)buttons block:(AlertBlock)block{
    PHPopBox * box =[[PHPopBox alloc]init];
    [box showAlertWithTitle:title message:message boxType:boxType buttons:buttons block:block];
}
-(void)showAlertWithTitle:(NSString *)title message:(NSString *)message boxType:(BoxType)boxType buttons:(NSArray<ControlStyle  *> *)buttons block:(AlertBlock)block{
    self.alertBlock=block;
    self.alpha=0;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha=1;
    }];
    
    
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-100*self.scale, 100*self.scale)];
    bgView.backgroundColor=[UIColor whiteColor];
    bgView.center=CGPointMake(self.width/2, self.height/2);
    [self addSubview:bgView];
    bgView.layer.cornerRadius=3*self.scale;
    bgView.layer.masksToBounds=YES;
    
    
    CGFloat setY=10*self.scale;
    UILabel * labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, setY, bgView.width, 20*self.scale)];
    labelTitle.textColor=[UIColor darkTextColor];
    labelTitle.text=title?title:@"提示";
    labelTitle.textAlignment=NSTextAlignmentCenter;
    [bgView addSubview:labelTitle];
    [labelTitle sizeToFit];
    setY=labelTitle.bottom+15*self.scale;
    
    
    
    UILabel * labelMessage = [[UILabel alloc]initWithFrame:CGRectMake(10*self.scale, setY, bgView.width-20*bgView.scale, 20*self.scale)];
    labelMessage.textColor=[UIColor darkTextColor];
    labelMessage.text=message?message:@"";
    [bgView addSubview:labelMessage];
    labelMessage.textAlignment=NSTextAlignmentCenter;
    [labelTitle sizeToFit];
    setY=labelMessage.bottom+15*self.scale;
    // edit code
    

    
    UIImageView * bottomLin =[[UIImageView alloc]initWithFrame:CGRectMake(0, setY, bgView.width, 0.5*self.scale)];
    bottomLin.backgroundColor=[UIColor lightGrayColor];
    [bgView addSubview:bottomLin];
    setY=bottomLin.bottom;


    CGFloat bw = bgView.width/buttons.count;
    CGFloat bh = 40*self.scale;
    
    
    UIView * bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, setY, bgView.width, bh)];
    [bgView addSubview:bottomView];
    setY=bottomView.bottom;
    bgView.height=setY;
    
    for (int i = 0; i < buttons.count; i++) {
        ControlStyle * style = buttons[i];
        CGFloat bx =(buttons.count-1-i) * bw;
        
        
        UIButton * bottomBtn = [[UIButton alloc]initWithFrame:CGRectMake(bx, 0, bw, bottomView.height)];
        [bottomView addSubview:bottomBtn];
        
        
    
        if (i != buttons.count-1 && buttons.count != 1) {
            UIView * btnLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0.5*self.scale, bh)];
            [bottomBtn addSubview:btnLine];
            btnLine.backgroundColor=[UIColor lightGrayColor];
        }
        
        
        
        [bottomBtn setTitle:style.title?style.title:@"" forState:UIControlStateNormal];
        [bottomBtn setTitleColor:style.color?style.color:[UIColor blackColor] forState:UIControlStateNormal];
        bottomBtn.tag=100+i;
        [bottomBtn addTarget:self action:@selector(bottomBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
 
        setY=bottomBtn.bottom;
    }
  
    
}
+(void)showSheetWithButtonStyles:(NSArray<ControlStyle *> *)styles block:(AlertBlock)block{
    [[PHPopBox new]showSheetWithButtonStyles:styles block:block];
}
-(void)showSheetWithButtonStyles:(NSArray<ControlStyle *> *)styles block:(AlertBlock)block{
    self.alertBlock=block;
    self.alpha=0;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha=1;
    }];
    
    
    CGFloat bh=50*self.scale;
    UIButton * cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.height-bh, self.width, bh)];
    [self addSubview:cancelBtn];
    cancelBtn.backgroundColor=[UIColor whiteColor];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancelBtn.tag=200;
    [cancelBtn addTarget:self action:@selector(bottomBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat setY= cancelBtn.top-5*self.scale;
  
    
    for (int i = 0; i < styles.count; i ++) {
        CGFloat by=setY-bh;
        ControlStyle * style=styles[i];
        
        UIButton * bottomBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, by, self.width, bh)];
        [self addSubview:bottomBtn];
        if (i != styles.count-1 && styles.count != 1) {
            UIView * btnLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, bottomBtn.width, 0.5*self.scale)];
            [bottomBtn addSubview:btnLine];
            btnLine.backgroundColor=[UIColor lightGrayColor];
        }
        
        
        
        bottomBtn.backgroundColor=[UIColor whiteColor];
        
   
        [bottomBtn setTitle:style.title?style.title:@"" forState:UIControlStateNormal];
        [bottomBtn setTitleColor:style.color?style.color:[UIColor blackColor] forState:UIControlStateNormal];
        bottomBtn.tag=100+i;
        [bottomBtn addTarget:self action:@selector(bottomBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        setY=bottomBtn.top;
    }
    
}


+(void)startLoadDataWithTitle:(NSString *)title{
    [[PHPopBox new] startLoadDataWithTitle:title];
}
-(void)startLoadDataWithTitle:(NSString *)title{
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 120*self.scale, 150*self.scale)];
    bgView.center=CGPointMake(self.width/2, self.height/2);
//    bgView.backgroundColor=[UIColor whiteColor];
    [self addSubview:bgView];
    
    
    
    UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100*self.scale, 100*self.scale)];
    img.center=CGPointMake(bgView.width/2, bgView.height/2);
    img.top=10*self.scale;
    [bgView addSubview:img];
    [img setAnimationImages:@[[UIImage ImageForColor:[UIColor redColor]],
                              [UIImage ImageForColor:[UIColor blueColor]],
                              [UIImage ImageForColor:[UIColor greenColor]]]];
    [img startAnimating];
    

    UILabel * labelTitle=[[UILabel alloc]initWithFrame:CGRectMake(0, img.bottom+5*self.scale, bgView.width, 20*self.scale)];
    [bgView addSubview:labelTitle];
//    labelTitle.backgroundColor=[UIColor blueColor];
    labelTitle.textColor=[UIColor blackColor];
    labelTitle.textAlignment=NSTextAlignmentCenter;
    labelTitle.text=title?title:@"正在加载中...";
    
    [self addTarget:self action:@selector(disMiss) forControlEvents:UIControlEventTouchUpInside];
}
-(void)bottomBtnAction:(UIButton *)sender{
    
    if (_alertBlock) {
        _alertBlock(sender.tag-100);
    }
    [self disMiss];
}
-(void)disMiss{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha=0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];

}

@end

