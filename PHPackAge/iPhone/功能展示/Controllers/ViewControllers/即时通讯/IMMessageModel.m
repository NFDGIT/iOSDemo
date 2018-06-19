//
//  IMMessageModel.m
//  PHPackAge
//
//  Created by penghui on 2018/6/19.
//  Copyright © 2018年 wdx. All rights reserved.
//

#import "IMMessageModel.h"

@implementation IMMessageModel
-(instancetype)initWithContent:(NSString *)content type:(IMMessageType)type{
    if (self = [super init]) {
        _content = content;
        _type = type;
    }
    return self;
    
}
@end
