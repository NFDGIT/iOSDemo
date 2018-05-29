//
//  HomePageViewController.m
//  PHPackAge
//
//  Created by penghui on 2018/5/28.
//  Copyright © 2018年 wdx. All rights reserved.
//

#import "HomePageViewController.h"
#import "PHCarouselView.h"
#import "PHSegmentViewController.h"
#import "FirstTableViewController.h"
#import "UIButton+Helper.h"

@interface HomePageViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)PHSegmentViewController * segment;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    

    
    // Do any additional setup after loading the view.
}
-(void)initUI{
    
    
    
    
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height-64)];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    PHCarouselView * carouselView =  [[PHCarouselView alloc]init];
    carouselView.datas = @[@"",@"",@"",@"",@"",@"",@"",@"",@""];
    carouselView.top = 0;
    [scrollView addSubview:carouselView];
    
    
    
    PHSegmentViewController * segment = [PHSegmentViewController new];
    segment.transitionStyle = UIPageViewControllerTransitionStyleScroll;
    segment.titleColor = [UIColor redColor];
    segment.titleFont = [UIFont systemFontOfSize:20 weight:YES];
    segment.titleViewHeight = 40;
    _segment = segment;
    
    
    
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    leftBtn.backgroundColor  =[UIColor redColor];
    segment.leftBtn = leftBtn;
    //    segment.leftBtn addTarget:self action:@selector(<#selector#>) forControlEvents:<#(UIControlEvents)#>
    

    
    [segment.leftBtn addEvents:UIControlEventTouchUpInside block:^(UIButton *target) {
        
        [UIView animateWithDuration:0.3 animations:^{
            scrollView.contentOffset = CGPointMake(0, 0);
        }];
        
    }];
    //    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    //    rightBtn.backgroundColor  =[UIColor redColor];
    //    segment.rightBtn = rightBtn;
    
    for (int i = 0; i < 2; i ++) {
        FirstTableViewController * VC = [FirstTableViewController new];
        VC.title = [NSString stringWithFormat:@"第%d",i];
        
        
        
        
        
        VC.datas =  @[@"hello swift \nhello swift \nhello swift \nhello swift \nhello swift \nhello swift \nhello swift ",
                      @"hello swift ",
                      @"hello swift \nhello swift \nhello swift \nhello swift  "
                      ];
        if (i == 1) {
            VC.datas =  @[@"hello swift \nhello swift \nhello swift \nhello swift ",
                          @"hello swift  \nhello swift \nhello swift \nhello swift\n hello swift  \nhello swift \nhello swift \nhello swift ",
                          @"hello swift "
                          ];
        }
        if (i == 2) {
            VC.datas =  @[@"hello swift  ",
                          @"hello swift  \nhello swift \nhello swift \nhello swift\n hello swift  \nhello swift \nhello swift \nhello swift ",
                          @"hello swift ",
                          @"hello swift  \nhello swift \nhello swift \nhello swift\n hello swift  \nhello swift \nhello swift \nhello swift ",
                          @"hello swift "
                          
                          ];
        }
        
        
        [segment.controllers  addObject:VC];
    }
    
    segment.view.frame = self.view.frame;
    
    
    
    [self addChildViewController:segment];
    segment.view.top = carouselView.bottom;
    segment.view.height = self.view.height- 64;
    [self.view addSubview:scrollView];
    [scrollView addSubview:segment.view];
    scrollView.contentSize = CGSizeMake(scrollView.width, segment.view.bottom);
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [_segment judgeContentWhetherScroll];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
