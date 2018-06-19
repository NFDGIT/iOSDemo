//
//  PHSocketTool.h
//  PHPackAge
//
//  Created by penghui on 2018/6/19.
//  Copyright © 2018年 wdx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PHSocketTool : NSObject
@property (nonatomic,strong)void(^newMsgBlock)(NSString * msg);


/**
 单例

 @return 返回一个单例对象
 */
+(instancetype)share;

//
///**
//  链接服务器
//
// @return 是否链接成功
// */
//-(BOOL)connect;

/**
 断开连接
 */
-(void)disConnect;

/**
 发送消息

 @param msg 发送的消息内容
 */
-(void)senderMsg:(NSString *)msg;

///**
// 获取消息
// */
//-(void)pullTheMsg;
@end
