//
//  SegViewController.m
//  PHPackAge
//
//  Created by penghui on 2018/1/31.
//  Copyright © 2018年 wdx. All rights reserved.
//

#import "SegViewController.h"
#import "PHSegmentViewController.h"
@interface SegViewController ()

@end

@implementation SegViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSMutableArray * datas = [NSMutableArray array];
    [datas addObject:@{@"title":@"全部"}];
    [datas addObject:@{@"title":@"趣生活"}];
    [datas addObject:@{@"title":@"一花一世界,一草一枯荣"}];
    [datas addObject:@{@"title":@"一草一枯荣"}];
    [datas addObject:@{@"title":@"万千世界"}];
    [datas addObject:@{@"title":@"经"}];
    
    
    PHSegmentViewController * segment = [PHSegmentViewController new];
    segment.transitionStyle = UIPageViewControllerTransitionStyleScroll;
    
    NSInteger i = 0;
    for (NSDictionary * dic in datas) {
        i ++;
        
        NSString * title = [NSString stringWithFormat:@"%@",dic[@"title"]];
        
        UIViewController * vc1 = [UIViewController new];
        vc1.title = title;
        vc1.view.backgroundColor  =[UIColor colorWithRed:1.0/i green:10*i / 255.0 blue:3*i / 255.0 alpha:1];
        [segment.controllers addObject:vc1];
    }
    
    [segment.controllers removeLastObject];
    segment.view.frame = self.view.frame;

    [self addChildViewController:segment];
    segment.view.top = 64;
    segment.view.height = self.view.height - 64;
    [self.view addSubview:segment.view];
    // Do any additional setup after loading the view.
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
