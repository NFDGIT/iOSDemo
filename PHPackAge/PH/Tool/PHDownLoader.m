//
//  PHDownLoader.m
//  PHPackAge
//
//  Created by wdx on 2016/12/5.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "PHDownLoader.h"

@interface PHDownLoader()<NSURLConnectionDataDelegate>

@end

@implementation PHDownLoader
+(instancetype)shareDownLoader{
    static PHDownLoader *share = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        share = [[PHDownLoader alloc] init];
        
        share.tasks=[NSMutableArray array];
        share.taskRank=0;
    });
    return share;
}
-(void)startWithUrl:(NSString *)urlString block:(void (^)(BOOL, float, NSData *))block{
    NSURLRequest * request=[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];

    NSURLConnection * connection=[NSURLConnection connectionWithRequest:request delegate:self];
    [_tasks addObject:@{[NSString stringWithFormat:@"task:%ld",(long)_taskRank]:connection}];
}


#pragma  mark -- connectionDelegate

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(nonnull NSURLResponse *)response{
    _taskRank++;
    
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{

    
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
}


@end
