//
//  PHSegmentViewController.m
//  PuJiYC
//
//  Created by penghui on 2018/1/30.
//  Copyright © 2018年 penghui. All rights reserved.
//

#import "PHSegmentViewController.h"
#import "PHTabbar.h"

@interface PHSegmentViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource,UIScrollViewDelegate>
@property (nonatomic,strong)PHTabbar     * titleView;

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
    
    _titleView = [[PHTabbar alloc]initWithTitles:@[] type:1 themeColor:[UIColor orangeColor] frame:CGRectMake(0, 0, self.view.width, 50)];
    _titleView.backgroundColor  =[UIColor whiteColor];
    [self.view addSubview:_titleView];
    _titleView.block = ^(NSInteger index) {
        
        UIPageViewControllerNavigationDirection  direction = UIPageViewControllerNavigationDirectionReverse;
        if (index > _currentIndex) {
            direction = UIPageViewControllerNavigationDirectionForward;
        }
        _currentIndex = index;
        [weakSelf.pageVC setViewControllers:@[weakSelf.controllers[index]] direction:direction animated:YES completion:^(BOOL finished) {
        }];
    };

    
    
    self.pageVC  =[[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageVC.view.frame  = CGRectMake(0, _titleView.bottom, self.view.width, self.view.height - self.titleView.bottom);
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];

    [self findScrollView].delegate = self;
    
    
    self.pageVC.delegate = self;
    self.pageVC.dataSource = self;
    
    [_pageVC setViewControllers:@[_controllers.firstObject] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL finished) {
    }];
}



-(void)refreshUI{
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

@end








