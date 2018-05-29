//
//  PHCarouselView.h
//  PHPackAge
//
//  Created by penghui on 2018/5/28.
//  Copyright © 2018年 wdx. All rights reserved.
//

//
//  PJ_HomePageCarouselView.h
//  PuJiTown
//
//  Created by penghui on 2018/5/17.
//  Copyright © 2018年 yst.com. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "PJ_HomeCarouselModel.h"

@interface PHCarouselView : UIView
@property (nonatomic,strong)NSArray  * datas;

@property (nonatomic,strong)void(^blockCall)(NSUInteger index);
@end

