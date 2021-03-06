//
//  TY_GoodsTableViewCell.m
//  PHPackAge
//
//  Created by penghui on 2018/5/30.
//  Copyright © 2018年 wdx. All rights reserved.
//

#import "TY_GoodsTableViewCell.h"


@interface TY_GoodsTableViewCell()
@property (nonatomic,strong)UIView * backView;

@property (nonatomic,strong)UIImageView * imgView;

@property (nonatomic,strong)UILabel * labelName;
@property (nonatomic,strong)UIButton *btnPrice;


@property (nonatomic,strong)UIImageView * authorImg;
@property (nonatomic,strong)UILabel * labelTitle;
@property (nonatomic,strong)UILabel * labelContent;
@property (nonatomic,strong)UIButton * btnFollow;
@end

@implementation TY_GoodsTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
    
}
-(void)initUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.backgroundColor =   self.contentView.backgroundColor = [UIColor clearColor];
    
    
    
    _backView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, 200)];
    _backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_backView];
    
    
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _backView.width, 200)];
    _imgView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    [_backView addSubview:_imgView];
    _imgView.contentMode = UIViewContentModeScaleAspectFill;
    _imgView.clipsToBounds = YES;
    
    
    
    UIView * imgBottomBack = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _imgView.width, 40)];
    imgBottomBack.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    [_imgView addSubview:imgBottomBack];
    imgBottomBack.bottom = _imgView.height;
    
    _labelName = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 200, 20)];
    _labelName.centerY = imgBottomBack.height/2;
    _labelName.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
    _labelName.font = [UIFont systemFontOfSize:15];
    _labelName.text = @"ABCZ专业幼教";
    [imgBottomBack addSubview:_labelName];
    
    _btnPrice = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    _btnPrice.right = imgBottomBack.width - 10;
    _btnPrice.centerY = imgBottomBack.height / 2;
    _btnPrice.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    //    [_btnPrice setImage:[UIImage imageNamed:@"open"] forState:UIControlStateNormal];
    [_btnPrice setTitle:@"￥300-900" forState:UIControlStateNormal];
    _btnPrice.titleLabel.font = [UIFont systemFontOfSize:15];
    [_btnPrice setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [imgBottomBack addSubview:_btnPrice];
    
    UIView * authorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _backView.width, 80)];
    [_backView addSubview:authorView];
    
    _authorImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
    _authorImg.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:0.8];
    _authorImg.contentMode = UIViewContentModeScaleAspectFit;
    [authorView addSubview:_authorImg];
    _authorImg.contentMode = UIViewContentModeScaleAspectFill;
    _authorImg.clipsToBounds = YES;
    
    
    _btnFollow = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 35)];
    _btnFollow.right = authorView.width - 10;
    _btnFollow.centerY = authorView.height/ 2;
    _btnFollow.layer.cornerRadius = 5;
    _btnFollow.layer.masksToBounds = YES;
    _btnFollow.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1].CGColor;
    _btnFollow.layer.borderWidth = 1;
    [_btnFollow setImage:[UIImage imageNamed:@"friend_jia"] forState:UIControlStateNormal];
    
    ;
    [_btnFollow setTitleColor:[UIColor colorWithRed:200/255.0 green:20.0/255.0 blue:27.0/255.0 alpha:1] forState:UIControlStateNormal];
    _btnFollow.titleLabel.font = [UIFont systemFontOfSize:12];
    [authorView addSubview:_btnFollow];
    [_btnFollow addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    _labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(_authorImg.right + 5, 10, _btnFollow.left - _authorImg.right - 10, 20)];
    _labelTitle.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    _labelTitle.font = [UIFont systemFontOfSize:15];
    _labelTitle.numberOfLines = 0;
    [authorView addSubview:_labelTitle];
    
    
    _labelContent = [[UILabel alloc]initWithFrame:CGRectMake(_authorImg.right + 5 , _labelTitle.bottom , _labelTitle.width, 20)];
    _labelContent.textColor = [UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:0.8];
    _labelContent.font = [UIFont systemFontOfSize:12];
    _labelContent.numberOfLines = 0;
    [authorView addSubview:_labelContent];
}
-(void)layout{
    CGFloat setY = 0;
    
    for (UIView * subView in _backView.subviews) {
        subView.top = setY;
        setY = subView.bottom + 10;
    }
    _backView.height = setY;
    
    
    self.ph_Height = _backView.height;
}

-(void)setModel:(TY_ShopMallContentCellModel*)model{
    _model = model;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_model.title]] placeholderImage:[UIImage imageNamed:@"moren"]];
    [_btnPrice setTitle:[NSString stringWithFormat:@"￥%@",_model.title] forState:UIControlStateNormal];
    _labelName.text = [NSString stringWithFormat:@"%@",_model.title];
    
    
    
    [_authorImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_model.title]] placeholderImage:[UIImage imageNamed:@"moren"]];
    _labelTitle.text = [NSString stringWithFormat:@"%@",_model.title];
    _labelContent.text = [NSString stringWithFormat:@"%@",_model.title];
    [_labelTitle sizeToFit];
    [_labelContent sizeToFit];
    

    
    
    [self layout];
    self.ph_Height = _backView.height;
}
#pragma mark - -  follow 点击事件
-(void)btnClick:(UIButton *)sender{
    if (_addCarCall) {
        _addCarCall(self.indexPath);
    }
}
@end
