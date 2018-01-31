//
//  PHDownLoader.h
//  PHPackAge
//
//  Created by wdx on 2016/12/5.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PHDownLoader : NSObject
@property (nonatomic,assign)NSInteger taskRank;

@property (nonatomic,strong)NSString * downPath;
@property (nonatomic,strong)NSMutableArray * tasks;


+(instancetype)shareDownLoader;
-(void)startWithUrl:(NSString *)urlString block:(void(^)(BOOL isSuccess,float progress,NSData * data))block;
@end
