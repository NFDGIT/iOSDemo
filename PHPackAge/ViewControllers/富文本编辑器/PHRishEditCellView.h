//
//  PHRishEditCellView.h
//  PHPackAge
//
//  Created by penghui on 2017/12/17.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewAdditions.h"
#import "PHRishEditModel.h"
@interface PHRishEditCellView : UIView
@property (nonatomic,assign)NSUInteger row;
@property (nonatomic,strong)PHRishEditModel * model;
@end
