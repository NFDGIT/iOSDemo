//
//  LaunchAdView.m
//  PHPackAge
//
//  Created by wdx on 16/9/5.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "LaunchAdView.h"

@interface LaunchAdView()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView * scrollView;
@end
@implementation LaunchAdView

-(instancetype)initWithMargin:(CGFloat)margin andDataS:(NSArray *)adverS{
    if (self=[super initWithFrame:[UIScreen mainScreen].bounds]) {
        _adverS=adverS;
        _margin=margin;
        self.backgroundColor=[UIColor colorWithRed:.8 green:.8 blue:.8 alpha:.7];
        [self setUpSrollView];
    }
    return self;
}
+(instancetype)insWithMargin:(CGFloat)margin andDataS:(NSArray *)adverS{
    LaunchAdView * launchAdView=[[LaunchAdView alloc]initWithMargin:margin andDataS:adverS];
    
    return launchAdView;
}

-(void)setAdverS:(NSArray *)adverS{
    _adverS=adverS;
    [self setUpSrollView];
}
-(void)setUpSrollView{
    if (_scrollView) {
        _scrollView=nil;
        [_scrollView removeFromSuperview];
    }
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width,self.frame.size.height)];

    _scrollView.pagingEnabled=YES;
    [self addSubview:_scrollView];
    _scrollView.delegate=self;
    float w=_scrollView.frame.size.width-_margin*2;
    float h=_scrollView.frame.size.height-_margin*2;
    float y=_margin;
    for (int i =0; i < _adverS.count; i ++) {
        float x= i * _scrollView.frame.size.width+_margin;
        
        
        UIImageView * imgView=[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        imgView.layer.cornerRadius=20;
        imgView.layer.masksToBounds=YES;

        imgView.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[_adverS[i] valueForKey:@"image_url"]]]];
        [_scrollView addSubview:imgView];
        
        
         imgView.tag=100+i;
        imgView.userInteractionEnabled=YES;
        UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [imgView addGestureRecognizer:tap];
    }
    _scrollView.contentSize=CGSizeMake(_scrollView.frame.size.width*_adverS.count, _scrollView.frame.size.height);
    
    
    
    UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(_margin+10, _margin+10, 40, 40)];
    btn.backgroundColor=[UIColor redColor];
    btn.layer.cornerRadius=btn.frame.size.width/2;
    btn.layer.masksToBounds=YES;
    [self addSubview:btn];
    [btn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
}
-(void)backBtn{
    [self removeFromSuperview];
}

-(void)tap:(UITapGestureRecognizer*)tap{
    NSLog(@"广告%ld",tap.view.tag-100);
}
@end
