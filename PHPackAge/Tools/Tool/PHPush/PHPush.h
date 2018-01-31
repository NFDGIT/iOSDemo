//
//  PHPush.h
//  PHPackAge
//
//  Created by MIAO on 2017/5/4.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^DicBlock)(NSDictionary * dic);
typedef void(^StringBlock)(NSString  * string);
typedef void(^RegistRemoteBlock)(NSData * token,NSError * error);
#define sharePush [PHPush share]

@interface PHPush : NSObject
@property (nonatomic,strong)DicBlock localBlock;
@property (nonatomic,strong)DicBlock remoteBlock;
@property (nonatomic,strong)RegistRemoteBlock registRemoteBlock;
+(instancetype)share;
-(void)localPushWithTitle:(NSString *)title body:(NSString *)body time:(NSInteger)time pram:(NSDictionary *)pram;
-(void)registWithBlock:(RegistRemoteBlock)block;
@end
