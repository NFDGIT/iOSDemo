//
//  CustomWebView.m
//  PHPackAge
//
//  Created by wdx on 16/8/22.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "CustomWebView.h"

@implementation CustomWebView
-(instancetype)init{
    if (self=[super init]) {
        [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"example" ofType:@"html"]]]];
    }
    return self;
}
//-(instancetype)initWithFrame:(CGRect)frame{
//    if (self=[super initWithFrame:frame]) {



//    }
//    return self;
//}

-(void)setNeedsLayout{
  [super setNeedsLayout];
    [self setUp];
    
}

-(void)setUp{
    self.jsContext=[self valueForKey:@"documentView.webView.mainFrame.javaScriptContext"];
    self.jsContext[@"loca"]=self;
    self.jsDelegate=self;
}
-(void)method1{
    NSLog(@"helllo");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
