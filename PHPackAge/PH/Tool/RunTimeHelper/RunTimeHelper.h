//
//  RunTimeHelper.h
//  PHPackAge
//
//  Created by MIAO on 2017/4/25.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunTimeHelper : NSObject
+(NSArray *)getPropertyListFromObj:(id)obj;
+(BOOL)addTarget:(id)target method:(NSString *)method;
+(void)addProperty:(NSString *)name class:(NSString *)c ToObj:(id)obj;


+(id)getPropertyFromObj:(id)obj withKey:(NSString *)key;


@end
