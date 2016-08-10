//
//  PHCalendarContentVC.h
//  PHPackAge
//
//  Created by wdx on 16/8/9.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "PHViewController.h"

@interface PHCalendarContentVC : PHViewController
@property (nonatomic,assign)NSInteger currentYear;
@property (nonatomic,assign)NSInteger currentMonth;




@property (nonatomic,assign)NSInteger dayOfWeekOfFirstDay;
@property (nonatomic,assign)NSInteger days;

+(instancetype)instantMonthPageWithCurrentYear:(NSInteger )year andMonth:(NSInteger)month;
@end
