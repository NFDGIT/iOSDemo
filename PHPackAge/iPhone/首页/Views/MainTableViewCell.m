//
//  MainTableViewCell.m
//  PackAge
//
//  Created by penghui on 2018/2/6.
//  Copyright © 2018年 penghui. All rights reserved.
//

#import "MainTableViewCell.h"
@interface MainTableViewCell()
@property (nonatomic,strong)UILabel * label;
@end
@implementation MainTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
-(void)initUI
{
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    _label.numberOfLines = 0;
    [self.contentView addSubview:_label];
}
-(void)setTitle:(NSString *)title{
    _title = title;
    _label.text = _title;
    [_label sizeToFit];
    
    self.ph_Height = _label.bottom;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
