//
//  ViewController.m
//  PHPackAge
//
//  Created by wdx on 16/7/7.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "ViewController.h"
#import "PHCalendar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 50, 30)];
    btn.backgroundColor=[UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
 
    
    
    
    UIImageView * imgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"22.jpg"]];
    imgView.frame=CGRectMake(100, 200, 300, 300);
//    [self.view addSubview:imgView];
    imgView.userInteractionEnabled=YES;
    UIPinchGestureRecognizer * pin=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pin:)];

    imgView.layer.anchorPoint=CGPointMake(0.5, .5);
    imgView.layer.position=CGPointMake(100, 200);
    [imgView addGestureRecognizer:pin];
    
    // Do any additional setup after loading the view.
}
-(void)pin:(UIPinchGestureRecognizer *)gesture{

    gesture.view.transform=CGAffineTransformScale(gesture.view.transform, gesture.scale, gesture.scale);
    CGPoint point0 = [gesture locationOfTouch:0 inView:gesture.view];
    NSLog(@"1   point   %f,%f\n",point0.x,point0.y);
    CGPoint point1 = [gesture locationOfTouch:1 inView:gesture.view];
    NSLog(@"2   point  %f,%f\n",point1.x,point1.y);
    CGPoint centerPoint=  CGPointMake((point0.x +point1.x)/2/gesture.view.width, (point0.y+point1.y)/2/gesture.view.height);
    
    gesture.view.layer.position=CGPointMake((point0.x +point1.x)/2+gesture.view.left, (point0.y+point1.y)/2+gesture.view.top);
    NSLog(@"%f %f\n",centerPoint.x,centerPoint.y);
    
    gesture.view.layer.anchorPoint=centerPoint;
    gesture.scale=1;
    gesture.scale=1;
    
}
-(void)btnClick:(UIButton *)sender{
      [self showPromptBoxWithSting:@"hellof"];
 
       PHCalendar * calendar=[[PHCalendar alloc]init];
    [self presentViewController:calendar animated:YES completion:nil];
//    [self showAlertWithTitle:nil content:@"内存不足"];
    
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
