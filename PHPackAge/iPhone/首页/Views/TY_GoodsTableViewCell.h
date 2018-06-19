//
//  TY_GoodsTableViewCell.h
//  PHPackAge
//
//  Created by penghui on 2018/5/30.
//  Copyright © 2018年 wdx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHCellHeight.h"
#import "TY_ShopMallContentCellModel.h"

@interface TY_GoodsTableViewCell : UITableViewCell
@property (nonatomic,strong)TY_ShopMallContentCellModel* model;
@property (nonatomic,strong)void(^addCarCall)(NSIndexPath  *index);
@end
