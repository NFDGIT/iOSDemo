//
//  PHSegmentViewController.m
//  PuJiYC
//
//  Created by penghui on 2018/1/30.
//  Copyright © 2018年 penghui. All rights reserved.
//

#import "PHSegmentViewController.h"



@interface PHSegmentViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource,UIScrollViewDelegate>
@property (nonatomic,strong)UIView       * titleViewBackView;
@property (nonatomic,strong)PHTabbarView     * titleView;

@property (nonatomic,assign)NSInteger currentIndex;

@property (nonatomic,strong)UIPageViewController * pageVC;
@property (nonatomic,strong)UIScrollView * scrollView;
@end

@implementation PHSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
    
    [self refreshUI];
    // Do any additional setup after loading the view.
}
-(void)initData{
    _currentIndex =  0;
    
}
-(void)initUI{
    __block typeof(self) weakSelf = self;
    
    
    UIView * titleViewBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.titleViewHeight)];
    titleViewBackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:titleViewBackView];
    _titleViewBackView = titleViewBackView;
    
    _titleView = [[PHTabbarView alloc]initWithTitles:@[] type:_tabbarViewType font:self.titleFont themeColor:self.titleColor frame:CGRectMake(0, 0, self.view.width, self.titleViewHeight)];
    _titleView.backgroundColor  =[UIColor whiteColor];
    [titleViewBackView addSubview:_titleView];
    _titleView.block = ^(NSInteger index) {
        
        UIPageViewControllerNavigationDirection  direction = UIPageViewControllerNavigationDirectionReverse;
        if (index > _currentIndex) {
            direction = UIPageViewControllerNavigationDirectionForward;
        }
        _currentIndex = index;
        [weakSelf.pageVC setViewControllers:@[weakSelf.controllers[index]] direction:direction animated:YES completion:^(BOOL finished) {
        }];
    };

    
    
    self.pageVC  =[[UIPageViewController alloc]initWithTransitionStyle:_transitionStyle navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageVC.view.frame  = CGRectMake(0, titleViewBackView.bottom, self.view.width, self.view.height - self.titleView.bottom);
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];

    [self findScrollView].delegate = self;
    
    
    self.pageVC.delegate = self;
    self.pageVC.dataSource = self;
    
    
    [_pageVC setViewControllers:@[_controllers.firstObject] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL finished) {
    }];
}



-(void)refreshUI{
    if (self.leftBtn) {
        [_titleViewBackView addSubview:self.leftBtn];
        self.leftBtn.left = 5;
        self.leftBtn.centerY = _titleViewBackView.height/2;
    }
    if (self.rightBtn) {
        [_titleViewBackView addSubview:self.rightBtn];
       
        self.rightBtn.right = _titleViewBackView.width -5;
        self.rightBtn.centerY = _titleViewBackView.height / 2;
    }
    
    CGFloat titleBGLeft = self.leftBtn.right + 5;
    CGFloat titleBGRight = self.rightBtn ? self.rightBtn.left : _titleViewBackView.width;
    
    _titleView.width = titleBGRight - titleBGLeft;
    _titleView.left  = titleBGLeft;
//    }
//    if (self.rightBtn) {
//        _titleView.width = _titleViewBackView.width - self.leftBtn.right - self.rightBtn.left;
//        _titleView.left  = self.leftBtn.right;
//    }
//    
    
    NSMutableArray * titles = [NSMutableArray array];
    for (UIViewController * vc in _controllers) {
        if (!vc.title) {
            vc.title = @"";
        }
        [titles addObject:vc.title];
    }
    [_titleView changeTitles:titles];
}

-(NSMutableArray *)controllers
{
    if (!_controllers) {
        _controllers = [NSMutableArray array];
    }
    return _controllers;
}



-(UIScrollView *)findScrollView{
    UIScrollView* scrollView;
    
    for(id subview in self.pageVC.view.subviews){
        
        if([subview isKindOfClass:UIScrollView.class]){
            
            scrollView=subview;
            break;
        }}
    
    return scrollView;

}

#pragma mark -- uipageViewController scrollView
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    _currentIndex ++;
    if (_currentIndex > _controllers.count -1) {
        _currentIndex = _controllers.count -1;
        return nil;
    }
    return _controllers[_currentIndex];
}
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    _currentIndex --;
    if (_currentIndex < 0 ) {
        _currentIndex = 0;
        return nil;
    }
    return _controllers[_currentIndex];
}
-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    NSInteger  index =   [_controllers indexOfObject:pageViewController.viewControllers.firstObject];
    _currentIndex = index;
    _titleView.index = index;
}
#pragma mark --  scrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"offset::::%f  right: x",scrollView.contentOffset.x);
    float offSet = (scrollView.contentOffset.x - scrollView.width)/scrollView.width;
    [_titleView changeUnderLineOffSet:offSet];
    
//    NSLog(@"offset:   :::::%f",offSet);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -- 参数的 set get 方法
//-(CGFloat)titleFont{
//    if (_titleFont <= 0) {
//        return 14;
//    }
//    return _titleFont;
//}
-(CGFloat)titleViewHeight{
    if (_titleViewHeight <= 0) {
        return 60;
    }
    return _titleViewHeight;
}
-(UIColor *)titleColor{
    if (!_titleColor) {
        _titleColor = [UIColor orangeColor];
    }
    return _titleColor;
}

#pragma mark -- 控制
-(UIScrollView *)superScrollView{
    if ([self.view.superview isKindOfClass:[UIScrollView class]]) { // 如果 父视图不是scroll view 则不做任何处理
        UIScrollView * scrollView =  (UIScrollView *)(self.view.superview);
        return scrollView;
    }
    return nil;
}

-(BOOL)contentCanScroll{
    UIScrollView * superScroll = [self superScrollView];
    
    if (!superScroll) { // 如果 父视图不是scroll view 则不做任何处理
        return YES;
    }
    CGFloat superOffSetY = superScroll.contentOffset.y;
    CGFloat selfTop      = self.view.top;
    
    if (superOffSetY >= selfTop) {
        
        superScroll.contentOffset = CGPointMake(superScroll.contentOffset.x, selfTop);
        return YES;
    }
    NSLog(@"%f:   :::::%f",superOffSetY,selfTop);
    
    return NO;
}

-(void)judgeContentWhetherScroll{

    BOOL canScroll = [self contentCanScroll];
    for (UIView * subView in self.view.allSubviews) {

        if ([subView isKindOfClass:[UITableView class]] || [subView isKindOfClass:[UICollectionView class]]) {
            UIScrollView * scrollView = (UIScrollView *)subView;
            scrollView.scrollEnabled = canScroll;
        }

    }
}

@end








