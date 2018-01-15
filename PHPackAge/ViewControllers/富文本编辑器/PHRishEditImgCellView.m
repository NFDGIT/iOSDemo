//
//  PHRishEditImgCellView.m
//  PHPackAge
//
//  Created by penghui on 2017/12/17.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import "PHRishEditImgCellView.h"
#import <UIImageView+WebCache.h>


@interface PHRishEditImgCellView()
@property (nonatomic,strong)UIImageView * imgView;
@end
@implementation PHRishEditImgCellView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
-(void)initUI{
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
//    _imgView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_imgView];
    [_imgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"placeHolder"]];
}
-(void)setModel:(PHRishEditModel *)model{
    [super setModel:model];

    [_imgView sd_setImageWithURL:[NSURL URLWithString:model.content] placeholderImage:[UIImage imageNamed:@"placeHolder"]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
