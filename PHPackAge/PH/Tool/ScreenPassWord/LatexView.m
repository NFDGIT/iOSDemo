//
//  LatexView.m
//  九宫格
//
//  Created by alive on 16/8/15.
//  Copyright © 2016年 alive. All rights reserved.
//

#import "LatexView.h"

@implementation LatexView

-(NSMutableArray *)btnArra
{
    if (_btnArra == nil) {
        _btnArra =[NSMutableArray array];
    }
    return _btnArra;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
        for (int i = 0; i<9; i++) {
            UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
            btn.userInteractionEnabled = NO;
            [btn setBackgroundImage:[UIImage imageNamed:@"black"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"blue"] forState:UIControlStateSelected];
            [btn setBackgroundImage:[UIImage imageNamed:@"error"] forState:UIControlStateDisabled];
            [self addSubview:btn];
            
            CGFloat width=74;
            CGFloat height=74;
            CGFloat Margin=(self.bounds.size.width-3*width)/4;
            //  遍历设置9个button的frame
            [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                //    通过tag设置按钮的索引标识
                obj.tag=idx;
                int row=(int)idx/3;
                int col=idx%3;
                obj.frame=CGRectMake(col*(Margin + width)+45, row*(Margin +height)+170, width, height);
            }];
        }

    }
    return self;
}
-(CGPoint)pointWithTouch:(NSSet *)touches
{
    //拿到触摸的点
    UITouch *touch =[touches anyObject];
    CGPoint point =[touch locationInView:touch.view];
    
    return point;
}
-(UIButton *)buttonWithPoint:(CGPoint )point
{
    //根据触摸的点拿到相应的按钮
    for (UIButton *btn in self.subviews) {
        //
        if (CGRectContainsPoint(btn.frame, point)) {
            return btn;
        }
    }
    return nil;
}

//开始触摸
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //拿到触摸的点
    CGPoint point =[self pointWithTouch:touches];
    //根据触摸的点拿到相应的按钮
    UIButton *btn =[self buttonWithPoint:point];
    if (btn && btn.selected == NO) {
        btn.selected = YES;
        [self.btnArra addObject:btn];//往数组或者字典中添加数组的时候要判断是否存在
    }
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //拿到触摸的点
    CGPoint point =[self pointWithTouch:touches];
    //根据触摸的点拿到相应的按钮
    UIButton *btn =[self buttonWithPoint:point];
    if (btn && btn.selected == NO) {
        btn.selected = YES;
        [self.btnArra addObject:btn];//往数组或者字典中添加数组的时候要判断是否存在
    }else{
        self.currentPoint = point;
    }
    [self setNeedsDisplay];
  
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(lockView:didFinishPath:)]) {
        NSMutableString *path =[NSMutableString string];
        for (UIButton *btn in self.btnArra) {
            [path appendFormat:@"%ld",(long)btn.tag];
        }
        [self.delegate lockView:self didFinishPath:path];
    }
    
    // 让数组中所有的按钮都调用一个方法：[btn setSelected:NO];
    [self.btnArra makeObjectsPerformSelector:@selector(setSelected:) withObject:@(NO)];
    
   
    //遍历按钮
    for (int i =0; i<self.btnArra.count; i++) {
        UIButton *btn =self.btnArra[i];
        [btn setSelected:NO];
    }
    // 清空数组
    [self.btnArra removeAllObjects];
    // 刷新
    [self setNeedsDisplay];
}
//-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self touchesEnded:touches withEvent:event];
//
//}




#pragma mark ---绘图
-(void)drawRect:(CGRect)rect
{
    if (self.btnArra.count == 0) {
        return;
    }
    UIBezierPath *path =[UIBezierPath bezierPath];
    path.lineWidth = 8;
    path.lineJoinStyle = kCGLineJoinRound;
    [[UIColor colorWithRed:32/255.0 green:210/255.0 blue:254/255.0 alpha:0.5]set];
    //遍历按钮
    for (int i =0; i<self.btnArra.count; i++) {
        UIButton *btn =self.btnArra[i];
        if (i  == 0) {//设置起点
            [path moveToPoint:btn.center];
        }else{
            [path addLineToPoint:btn.center];
        }
    }
    [path addLineToPoint:self.currentPoint];
    [path stroke];
}

@end
