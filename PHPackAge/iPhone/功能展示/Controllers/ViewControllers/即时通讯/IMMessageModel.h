//
//  IMMessageModel.h
//  PHPackAge
//
//  Created by penghui on 2018/6/19.
//  Copyright © 2018年 wdx. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger,IMMessageType)
{
    IMMessageTypeMe = 0,
    IMMessageTypeOther = 1,
};


@interface IMMessageModel : NSObject
-(instancetype)initWithContent:(NSString *)content type:(IMMessageType)type;
@property (nonatomic,assign)IMMessageType type;
@property (nonatomic,strong)NSString * content;
@end
