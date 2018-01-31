//
//  PHButton.m
//  PHPackAge
//
//  Created by MIAO on 2017/4/25.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import "PHButton.h"
@interface PHButton()


@property (nonatomic,assign)PHButtonType btnType;

@property (nonatomic,strong)UIImageView * img;
@property (nonatomic,strong)UILabel     * label;


@end
@implementation PHButton

-(UIImageView *)img{
    if (!_img) {
        _img=[UIImageView new];
        [self addSubview:_img];
    }
    return _img;
}
-(UILabel *)label{
    if (!_label) {
        _label=[UILabel new];
        [self addSubview:_label];
    }
    return _label;
}
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    
    [_img setImage:selected?[self imageForState:UIControlStateSelected]:[self imageForState:UIControlStateNormal]];
   
    
    [_label setText:selected?[self titleForState:UIControlStateSelected]:[self titleForState:UIControlStateNormal]];
    [_label setTextColor:selected?[self titleColorForState:UIControlStateSelected]:[self titleColorForState:UIControlStateNormal]];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    switch (_btnType) {
        case phButtonTypeTop:
            
            
            break;
        case phButtonTypeBottom:
            
            break;
        case phButtonTypeLeft:
            
            break;
        case phButtonTypeRight:
            
            break;
            
        default:
            break;
    }

    
}
-(void)newView{
    switch (_btnType) {
        case phButtonTypeTop:
            
            break;
        case phButtonTypeBottom:
            
            break;
        case phButtonTypeLeft:
            
            break;
        case phButtonTypeRight:
            
            break;
            
        default:
            break;
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
