//
//  PHCalendarItem.m
//  PHPackAge
//
//  Created by wdx on 16/8/10.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "PHCalendarItem.h"
#import "PHDefine.h"



@implementation PHCalendarItem
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self newView];
    }
    return self;
}
-(void)newView{
    _viewImg=[UIImageView new];
    [self addSubview:_viewImg];
    
    _labelTitle=[UILabel new];
    _labelTitle.textAlignment=NSTextAlignmentCenter;
    _labelTitle.font=[UIFont systemFontOfSize:17];
    _labelTitle.textColor=[UIColor blackColor];
    [self addSubview:_labelTitle];
    
    _lunarCalendar=[UILabel new];
    _lunarCalendar.textAlignment=NSTextAlignmentCenter;
    _lunarCalendar.font=[UIFont systemFontOfSize:12];
    _lunarCalendar.textColor=[UIColor blackColor];
    [self addSubview:_lunarCalendar];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    _viewImg.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    _labelTitle.frame=CGRectMake(0, 10, self.frame.size.width, self.frame.size.height/2-10);
    _labelTitle.text=[NSString stringWithFormat:@"%ld",_day];
    
    _lunarCalendar.frame=CGRectMake(0, _labelTitle.bottom, self.width, _labelTitle.height);
    _lunarCalendar.text=_lunarDay;
    
    switch (_itemType) {
        case PHCalendarItemType1:
            self.backgroundColor=[UIColor purpleColor];
            break;
        case PHCalendarItemType2:
            self.backgroundColor=[UIColor blueColor];
            break;
            
        default:
            break;
    }
    self.viewImg.backgroundColor=[UIColor lightGrayColor];
  
    if (_isToday) {
        self.viewImg.backgroundColor=[UIColor blueColor];
    }
    if (self.selected) {
        self.viewImg.backgroundColor=[UIColor redColor];
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
