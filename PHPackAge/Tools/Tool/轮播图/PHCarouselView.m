//
//  PHCarouselView.m
//  PHPackAge
//
//  Created by penghui on 2018/5/28.
//  Copyright © 2018年 wdx. All rights reserved.
//

//
//  PJ_HomePageCarouselView.m
//  PuJiTown
//
//  Created by penghui on 2018/5/17.
//  Copyright © 2018年 yst.com. All rights reserved.
//

#import "PHCarouselView.h"
@interface PHCarouselView()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView * scrollView;

@property (nonatomic,strong)UIPageControl * pageControl;

@property (nonatomic,assign)NSInteger currentIndex;


@property (nonatomic,strong)UIImageView * leftImgView;
@property (nonatomic,strong)UIImageView * middleImgView;
@property (nonatomic,strong)UIImageView * rightImgView;

@end
@implementation PHCarouselView
-(instancetype)init
{
    if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 210)]) {
        [self initData];
        [self initUI];
        [self initScaleView];
        [self initTimer];
        
    }
    return self;
}
-(void)initData{
    _currentIndex = 0;
}
-(void)initTimer{
    [NSTimer scheduledTimerWithTimeInterval:4 repeats:YES block:^(NSTimer * _Nonnull timer) {
        //        self.currentIndex ++;
        
        [UIView animateWithDuration:0.5 animations:^{
            _scrollView.contentOffset = CGPointMake(_scrollView.width * 2, 0);
        } completion:^(BOOL finished) {
            [self endScroll:_scrollView];
        }];
        
        
    }];
    
}
-(void)initUI{
    //    self.backgroundColor  =[UIColor blueColor];
    
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(30, 0, self.width-60, self.height)];
    scrollView.clipsToBounds = NO;
    [self addSubview:scrollView];
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    _scrollView = scrollView;
    
    
    UIPageControl * pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, self.width, 20)];
    [self addSubview:pageControl];
    pageControl.bottom = self.height;
    pageControl.pageIndicatorTintColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
    pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    [pageControl addTarget:self action:@selector(pageClick:) forControlEvents:UIControlEventValueChanged];
    _pageControl = pageControl;
    
    
    
    
    CGFloat space = 3;
    CGFloat spaceY = 15;
    CGFloat imgW = _scrollView.width - space * 2;
    CGFloat imgH = _scrollView.height -  spaceY * 2 - 10;
    
    for (int i = 0; i < 3; i ++) {
        CGFloat imgX = space + _scrollView.width * i;
        CGFloat imgY = spaceY;
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(imgX, imgY, imgW, imgH)];
        imgView.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0.8];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.layer.cornerRadius = 5;
        imgView.layer.masksToBounds = YES;
        imgView.tag = 100 + i;
        imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgTap:)];
        [imgView addGestureRecognizer:tap];
        
        [_scrollView addSubview:imgView];
        _scrollView.contentSize =CGSizeMake(imgView.right + space, _scrollView.height);
        [imgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"moren"]];
        
        switch (i) {
            case 0:
                _leftImgView = imgView;
                break;
            case 1:
                _middleImgView = imgView;
                break;
            case 2:
                _rightImgView = imgView;
                break;
                
            default:
                break;
        }
    }
    
    
    
}
-(void)setDatas:(NSArray *)datas{
    _datas = datas;
    
    [self refreshUI];
}

-(void)refreshUI{
    
    _pageControl.numberOfPages = _datas.count;
    
    [self refreshImg];
    
}
-(void)refreshImg{
    if (_datas.count <= 0) {
        return;
    }
    
    for (int i = 100 ; i < 103; i++) {
        UIImageView * imgView = [_scrollView viewWithTag:i];
        
        
        NSInteger index = _currentIndex;
        if (i == 100) {
            index = _currentIndex - 1;
            if (index < 0) {
                index = _datas.count -1;
            }
        }else if (i == 102){
            index = _currentIndex + 1;
            if (index >= _datas.count) {
                index = 0;
            }
        }
    
        [imgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"moren"]];
        
    }
    
    
    if (_datas.count <= 0) {
        
    }
    
}


-(void)pageClick:(UIPageControl *)sender{
    [UIView animateWithDuration:1 animations:^{
        _scrollView.contentOffset = CGPointMake(sender.currentPage * _scrollView.width, 0);
    }];
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat scale =  fabs(scrollView.contentOffset.x - scrollView.width) / scrollView.width;
    
    
    //    NSLog(@"%f",fabs(scrollView.contentOffset.x - scrollView.width));
    //    NSLog(@"%f",fabs(scrollView.contentOffset.x - scrollView.width)/ scrollView.width);
    [self scaleView:scale];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self endScroll:scrollView];
}
-(void)endScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x == 0) {
        _currentIndex --;
        if(_currentIndex < 0)
        {
            _currentIndex =_datas.count -1;
        }
    }else{
        _currentIndex ++;
        if (_currentIndex > _datas.count -1) {
            _currentIndex = 0;
        }
    }
    
    scrollView.contentOffset = CGPointMake(scrollView.width, 0);
    _pageControl.currentPage = _currentIndex;
    
    [self refreshImg];
}

-(void)scaleView:(CGFloat)scale{
    //    NSLog(@"%f",scale);
    
    CGFloat resultScale =  0.2 * (1-scale);
    CGFloat result1Scale = 0.2 * (1-scale);
    
    _leftImgView.transform = CGAffineTransformMakeScale(1.1-result1Scale, 1.1-result1Scale);
    _rightImgView.transform = CGAffineTransformMakeScale(1.1-result1Scale, 1.1-result1Scale);
    
    _middleImgView.transform = CGAffineTransformMakeScale(0.9+resultScale, 0.9+resultScale);
}
-(void)initScaleView{
    
    //    _leftImgView.transform = CGAffineTransformIdentity;
    //    _rightImgView.transform = CGAffineTransformIdentity;
    //    _middleImgView.transform = CGAffineTransformIdentity;
    
    _scrollView.contentOffset = CGPointMake(_scrollView.width, 0);
    
    _leftImgView.transform = CGAffineTransformMakeScale(0.9, 0.9);
    _rightImgView.transform = CGAffineTransformMakeScale(0.9, 0.9);
    _middleImgView.transform = CGAffineTransformMakeScale(1.1, 1.1);
}


-(void)setCurrentIndex:(NSInteger)currentIndex
{
    _currentIndex = currentIndex;
    
    
}
#pragma mark -- 点击事件
-(void)imgTap:(UITapGestureRecognizer *)tap
{
    if (_datas.count <= 0) {
        return;
    }
    
    if (_blockCall) {
        _blockCall(self.currentIndex);
    }
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */




@end

