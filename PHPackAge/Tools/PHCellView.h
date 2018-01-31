//
//  PHCellView.h
//  PHJD
//
//  Created by wdx on 16/7/6.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PHCellView : UIView
@property (nonatomic,strong)UIView * topLine;
@property (nonatomic,strong)UIView * bottonLine;


@property (nonatomic,assign)NSInteger index;
@property (nonatomic,assign)BOOL isAutoJudgeLine;


-(void)showShortBottonLine;

@end
