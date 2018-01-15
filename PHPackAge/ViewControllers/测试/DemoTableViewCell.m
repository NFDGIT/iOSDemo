//
//  DemoTableViewCell.m
//  PHPackAge
//
//  Created by penghui on 2018/1/15.
//  Copyright © 2018年 wdx. All rights reserved.
//

#import "DemoTableViewCell.h"
#import "UIViewAdditions.h"



@interface DemoTableViewCell()
@property (nonatomic,strong)UILabel * label;
@end
@implementation DemoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
-(void)initUI{
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 10)];
    _label.numberOfLines = 0;
    [self.contentView addSubview:_label];
    _label.backgroundColor  =[UIColor redColor];
    
    
    self.contentView.height = 200;

}
-(void)setTitle:(NSString *)title{
    _title = title;
    _label.text = title;
    [_label sizeToFit];
    

    self.ph_Height = _label.bottom;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
//    self.ph_Height = 100;
  
}
    
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
