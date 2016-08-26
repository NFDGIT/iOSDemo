//
//  CustomWebView.h
//  PHPackAge
//
//  Created by wdx on 16/8/22.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol JavaScriptDelegate <JSExport>
-(void)method1;

@end
@interface CustomWebView : UIWebView<JavaScriptDelegate>
@property (nonatomic,strong)id <JavaScriptDelegate> jsDelegate;
@property (nonatomic,strong)JSContext * jsContext;
@end
