//
//  PHRishEditModel.m
//  PHPackAge
//
//  Created by penghui on 2017/12/17.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import "PHRishEditModel.h"

@implementation PHRishEditModel
-(instancetype)initWithCellType:(PHRishEditCellViewType )cellType content:(NSString *)content{
    if (self=[super init]) {

        _cellType = cellType;
        _content  = content;
    }
    return self;
}
@end
