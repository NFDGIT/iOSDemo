//
//  RunTimeHelper.m
//  PHPackAge
//
//  Created by MIAO on 2017/4/25.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import "RunTimeHelper.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
/*
 
 
*/
static char colorKey;
@implementation RunTimeHelper
+(void)a{
    objc_property_t property;
    objc_property_attribute_t attribute;
    objc_objectptr_t  object;
    
    UIButton * btn ;
//    [btn addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
//    
//    objc_setAssociatedObject(<#id object#>, <#const void *key#>, <#id value#>, <#objc_AssociationPolicy policy#>)
//    objc_getAssociatedObject(<#id object#>, <#const void *key#>)
}
+(NSArray *)getPropertyListFromObj:(id)obj{//
    NSMutableArray * propertyList = [NSMutableArray array];
    unsigned int count = 0 ;
    
   
    
    
 
    objc_property_t * propertes = class_copyPropertyList([obj class], &count);
    for (int i = 0 ; i < count; i ++) {
        [propertyList addObject:@{@(property_getName(propertes[i])):@(property_getAttributes(propertes[i]))}];
    }
    

    
    return propertyList;
}
+(BOOL)addTarget:(id)target method:(NSString *)method{
    
    
    
    return YES;
}
+(void)addProperty:(NSString *)name class:(NSString *)c ToObj:(id)obj{
    NSString * propertyName = [NSString stringWithFormat:@"_%@",name];
    NSString * className = [NSString stringWithFormat:@"@\"%@\"",c];
    objc_property_attribute_t nonatomic = {"N", ""};
    objc_property_attribute_t strong = {"&", ""};
    objc_property_attribute_t type = {"T", [className UTF8String]};
    objc_property_attribute_t ivar = {"V", [propertyName UTF8String]};
    objc_property_attribute_t attributes[] = {nonatomic,strong,type,ivar};
    class_addProperty([obj class], [c UTF8String], attributes, 4);
    
//    objc_property_t //

}
+(id)getPropertyFromObj:(id)obj withKey:(NSString *)c{
    return  objc_getAssociatedObject(obj, &colorKey);
}
@end
