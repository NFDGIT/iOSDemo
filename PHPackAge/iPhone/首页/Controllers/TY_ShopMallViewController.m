//
//  HomePageViewController.m
//  PHPackAge
//
//  Created by penghui on 2018/5/28.
//  Copyright © 2018年 wdx. All rights reserved.
//

#import "TY_ShopMallViewController.h"

#import "TY_ShopMallTitleModel.h"

/*
 控制器
 */
#import "PHSegmentViewController.h"
#import "FirstTableViewController.h"
#import "TY_SearchCommissionerViewController.h" //搜索服务专员
#import "UIButton+Helper.h"

@interface TY_ShopMallViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)PHSegmentViewController * segment;
@end

@implementation TY_ShopMallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    

    
    // Do any additional setup after loading the view.
}
-(void)initUI{
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height-64)];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    
    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 200)];
    topView.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.8];
    [scrollView addSubview:topView];

    
    
    
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    [btn setTitle:@"更多服务专员" forState:UIControlStateNormal];
    [topView addSubview:btn];
    btn.bottom = topView.height - 10;
    btn.right = topView.width - 10;
    [btn addTarget:self action:@selector(moreCommissioner) forControlEvents:UIControlEventTouchUpInside];
//    PHCarouselView * carouselView =  [[PHCarouselView alloc]init];
//    carouselView.datas = @[@"",@"",@"",@"",@"",@"",@"",@"",@""];
//    carouselView.top = 0;
//    [scrollView addSubview:carouselView];
    
    
    
    PHSegmentViewController * segment = [PHSegmentViewController new];
    segment.transitionStyle = UIPageViewControllerTransitionStyleScroll;
    segment.tabbarViewType = TabbarTypeScrollUnderline;
    segment.titleColor = [UIColor redColor];
    segment.titleFont = [UIFont systemFontOfSize:20 weight:YES];
    segment.titleViewHeight = 40;
    _segment = segment;
    
    
    
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    leftBtn.backgroundColor  =[UIColor redColor];
    segment.rightBtn = leftBtn;
    //    segment.leftBtn addTarget:self action:@selector(<#selector#>) forControlEvents:<#(UIControlEvents)#>
    

    
    [segment.leftBtn addEvents:UIControlEventTouchUpInside block:^(UIButton *target) {
        
        [UIView animateWithDuration:0.3 animations:^{
            scrollView.contentOffset = CGPointMake(0, 0);
        }];
        
    }];
    //    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    //    rightBtn.backgroundColor  =[UIColor redColor];
    //    segment.rightBtn = rightBtn;
    
    
    
    
    TY_ShopMallTitleModel * model = [TY_ShopMallTitleModel new];
    model.title = @"全部";
    TY_ShopMallTitleModel * model1 = [TY_ShopMallTitleModel new];
    model1.title = @"推荐";
    TY_ShopMallTitleModel * model2 = [TY_ShopMallTitleModel new];
    model2.title = @"美妆";
    TY_ShopMallTitleModel * model3 = [TY_ShopMallTitleModel new];
    model3.title = @"健康";
    TY_ShopMallTitleModel * model4 = [TY_ShopMallTitleModel new];
    model4.title = @"娱乐";
    TY_ShopMallTitleModel * model5 = [TY_ShopMallTitleModel new];
    model5.title = @"时尚";
    TY_ShopMallTitleModel * model6 = [TY_ShopMallTitleModel new];
    model6.title = @"关注";
    TY_ShopMallTitleModel * model7 = [TY_ShopMallTitleModel new];
    model7.title = @"军事";
    
    NSArray * titles = @[model,model1,model2,model3,model4,model5,model6,model7];
    
    for (int i = 0; i < titles.count; i ++) {
        TY_ShopMallTitleModel * currentModel = titles[i];
        
        FirstTableViewController * VC = [FirstTableViewController new];
        VC.title = [NSString stringWithFormat:@"%@",currentModel.title];
        
        
        
        
        
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
    segment.view.top = topView.bottom;
    segment.view.height = self.view.height- 64;
    [self.view addSubview:scrollView];
    [scrollView addSubview:segment.view];
    scrollView.contentSize = CGSizeMake(scrollView.width, segment.view.bottom);
    
}

#pragma mark -- 点击事件
-(void)moreCommissioner{
    TY_SearchCommissionerViewController * commissioner = [TY_SearchCommissionerViewController new];
    [self.navigationController pushViewController:commissioner animated:YES];
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
