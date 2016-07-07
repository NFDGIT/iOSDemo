//
//  PHCellView.m
//  PHJD
//
//  Created by wdx on 16/7/6.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "PHCellView.h"
#import "PHDefine.h"

@implementation PHCellView
-(instancetype)init{
    if (self=[super init]) {
        [self newView];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self newView];
    }
    return self;
}
-(void)newView{
    _topLine=[[UIView alloc]init];
    _topLine.backgroundColor=[UIColor lightGrayColor];
    _topLine.hidden=YES;
    [self addSubview:_topLine];
    
    _bottonLine=[[UIView alloc]init];
    _bottonLine.backgroundColor=[UIColor lightGrayColor];
    _bottonLine.hidden=YES;
    
    [self addSubview:_bottonLine];
}
-(void)showShortBottonLine{
    _bottonLine.left=10;
    _bottonLine.width=self.width-20;
}

-(void)layoutSubviews{
    _topLine.frame=CGRectMake(0, 0, self.width, .5);
    _bottonLine.frame=CGRectMake(0, self.bottom-.5, self.width, .5);
    if (_isAutoJudgeLine) {
        if (_index==0) {
            _topLine.hidden=NO;
        }
        _bottonLine.hidden=NO;
        [self showShortBottonLine];
        
    }
  
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
