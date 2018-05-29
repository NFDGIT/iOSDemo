//
//  PHRishEditViewController.m
//  PHPackAge
//
//  Created by penghui on 2017/12/17.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import "PHRishEditViewController.h"
#import "PHRishEditView.h"



@interface PHRishEditViewController ()
@property (nonatomic,strong)PHRishEditView * editView;

@property (nonatomic,strong)UIScrollView * scrollView;

@end

@implementation PHRishEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    
    

    
    
    // Do any additional setup after loading the view.
}

-(void)initUI{
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,64, self.view.width, self.view.height-64)];
    [self.view addSubview:_scrollView];
    
    PHRishEditView * editView = [[PHRishEditView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.frame.size.height)];
    [_scrollView addSubview:editView];
      editView.heightChange = ^(CGFloat height) {
        _scrollView.contentSize = CGSizeMake(_scrollView.width, height);
    };
    
//      [_datas addObject:[[PHRishEditModel alloc]initWithCellType:PHRishEditCellViewTypeText content:@""]];
    editView.datas = [NSMutableArray arrayWithArray:@[[[PHRishEditModel alloc]initWithCellType:PHRishEditCellViewTypeText content:@"1"]
                                                      
                                                      ]];
//    [editView layoutCellView];
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
