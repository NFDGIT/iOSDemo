//
//  PublishViewController.m
//  PHPackAge
//
//  Created by penghui on 2018/1/31.
//  Copyright © 2018年 wdx. All rights reserved.
//

#import "PublishViewController.h"

#import "OtherViewController.h"
@interface PublishViewController ()

@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  =[UIColor whiteColor];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(next) name:@"name" object:nil];
    
    

    
    UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(post) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // Do any additional setup after loading the view.
}
-(void)next{
    
    [self presentViewController:[OtherViewController new]  animated:YES completion:^{
        
    }];
    
    
    
//    [self pushViewController:[OtherViewController new] animated:YES];
//    OtherViewController
}
-(void)post{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"name" object:nil];
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
