//
//  PHRishEditView.h
//  PHPackAge
//
//  Created by penghui on 2017/12/17.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHRishEditTextCellView.h"
#import "PHRishEditImgCellView.h"


#import "PHRishEditModel.h"
@interface PHRishEditView : UIView
@property (nonatomic,strong)NSMutableArray * datas;
@property (nonatomic,strong)void (^heightChange)(CGFloat height);
//-(void)layoutCellView;
@end
