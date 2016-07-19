//
//  ViewController.m
//  PHPackAge
//
//  Created by wdx on 16/7/7.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 50, 30)];
    btn.backgroundColor=[UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
  
    // Do any additional setup after loading the view.
}
-(void)btnClick:(UIButton *)sender{
//      [self showPromptBoxWithSting:@"hellof"];
    [self showAlertWithTitle:nil content:@"内存不足"];
    
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
