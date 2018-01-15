//
//  PHRishEditModel.h
//  PHPackAge
//
//  Created by penghui on 2017/12/17.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger,PHRishEditCellViewType) {
    PHRishEditCellViewTypeText = 0,
    PHRishEditCellViewTypeImg = 1,
};


@interface PHRishEditModel : NSObject
-(instancetype)initWithCellType:(PHRishEditCellViewType )cellType content:(NSString *)content;
@property (nonatomic,strong)NSString * content;
@property (nonatomic,assign)PHRishEditCellViewType cellType;
@end
