//
//  DemoTableViewCell.m
//  PHPackAge
//
//  Created by penghui on 2018/1/15.
//  Copyright © 2018年 wdx. All rights reserved.
//

#import "DemoTableViewCell.h"
#import "UIViewAdditions.h"
#import <UIImageView+WebCache.h>


@interface DemoTableViewCell()
@property (nonatomic,strong)UILabel * label;
@property (nonatomic,strong)UIImageView * imgView;
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
    
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
    [self.contentView addSubview:_imgView];
    
    self.contentView.height = 200;

}
-(void)setTitle:(NSString *)title{
    _title = title;
    _label.text = title;
    [_label sizeToFit];
    
    _imgView.top = _label.bottom;
//    [_imgView ]
    [_imgView sd_setImageWithURL:[NSURL URLWithString:@"http://img15.3lian.com/2015/a1/03/d/163.jpg"] placeholderImage:[UIImage imageNamed:@""] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
        _imgView.height = _imgView.width *  (image.size.height / image.size.width);
        self.ph_Height = _imgView.bottom;
        
        
        
        NSLog(@"%f,%f",self.ph_Height,_imgView.bottom);
        if (self.loadImgFinish && self.ph_Height != _imgView.bottom) {
            self.loadImgFinish();
        }
    }];
    
    
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
