//
//  DemoTableViewCell.h
//  PHPackAge
//
//  Created by penghui on 2018/1/15.
//  Copyright © 2018年 wdx. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "UITableViewCell+cellHeight.h"

#import "PHCellHeight.h"
@interface DemoTableViewCell : UITableViewCell


@property (nonatomic,strong)CGFloat(^heightBlock)(UITableView * tableView);
@property (nonatomic,strong)NSString * title;
@end
