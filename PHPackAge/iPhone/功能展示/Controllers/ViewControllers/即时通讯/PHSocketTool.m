//
//  PHSocketTool.m
//  PHPackAge
//
//  Created by penghui on 2018/6/19.
//  Copyright © 2018年 wdx. All rights reserved.
//

#import "PHSocketTool.h"
#import <GCDAsyncSocket.h>

static NSString * Khost = @"127.0.0.1";
static const uint16_t Kport = 6969;


@interface PHSocketTool()<GCDAsyncSocketDelegate>
@property (nonatomic,strong)GCDAsyncSocket * gcdSocket;

@end
@implementation PHSocketTool

/**
 单例
 
 @return 返回一个单例对象
 */
+(instancetype)share{
    static dispatch_once_t onceToken;
    static PHSocketTool * instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[PHSocketTool alloc]init];
        [instance initSocket];
        [instance connect];
    });
    return instance;
}


/**
 链接服务器
 
 @return 是否链接成功
 */
-(BOOL)connect{
    return  [_gcdSocket connectToHost:Khost onPort:Kport error:nil];
}

/**
 断开连接
 */
-(void)disConnect{
    [_gcdSocket disconnect];
}

/**
 发送消息
 
 @param msg 发送的消息内容
 */
-(void)senderMsg:(NSString *)msg{
    NSData * data = [msg dataUsingEncoding:NSUTF8StringEncoding];
    [_gcdSocket writeData:data withTimeout:-1 tag:110];
}

/**
 获取消息
 */
-(void)pullTheMsg{
    //监听读数据的代理  -1永远监听，不超时，但是只收一次消息，
    //所以每次接受到消息还得调用一次
    [_gcdSocket readDataWithTimeout:-1 tag:110];
}


#pragma mark -- 私有方法

/**
 初始化socket
 */
-(void)initSocket{
    _gcdSocket =[[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    
}
#pragma mark -- delegate
//连接成功调用
-(void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port{
   NSLog(@"连接成功,host:%@,port:%d",host,port);
    [self pullTheMsg];
}
//断开连接的时候调用
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(nullable NSError *)err
{
    NSLog(@"断开连接,host:%@,port:%d",sock.localHost,sock.localPort);
    
    //断线重连写在这...
    
}
//写成功的回调
- (void)socket:(GCDAsyncSocket*)sock didWriteDataWithTag:(long)tag
{
    //    NSLog(@"写的回调,tag:%ld",tag);
}

//收到消息的回调
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    
    NSString *msg = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"收到消息：%@",msg);
    if (_newMsgBlock) {
        _newMsgBlock(msg);
    }
    [self pullTheMsg];
}




@end
