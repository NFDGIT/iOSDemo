//
//  LatexView.h
//  九宫格
//
//  Created by alive on 16/8/15.
//  Copyright © 2016年 alive. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LatexView;
@protocol laterxViewDelegate <NSObject>

-(void)lockView:(LatexView *)latexView didFinishPath:(NSString *)path;

@end

@interface LatexView : UIView

//声明代理
@property(nonatomic,assign)id<laterxViewDelegate>delegate;
@property(nonatomic,strong)NSMutableArray *btnArra;

@property(nonatomic,assign)CGPoint currentPoint;

@end
