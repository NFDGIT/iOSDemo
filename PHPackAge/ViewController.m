//
//  ViewController.m
//  PHPackAge
//
//  Created by wdx on 16/7/7.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "ViewController.h"

#import "ImageCutTool.h"

#import "CustomWebView.h"
@interface ViewController ()
@property (nonatomic,strong)UIImageView * imgsource;
@property (nonatomic,strong)UIView * marquee;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imgsource=[[UIImageView alloc]initWithFrame:self.view.frame];
//    _imgsource.image=[UIImage imageNamed:@"111.jpg"];

    [self.view addSubview:_imgsource];
    
    UIImageView * imgView=[[UIImageView alloc]initWithFrame:CGRectMake(200, 400, 200, 200)];
    imgView.center=self.view.center;
    imgView.tag=101;
    imgView.contentMode=UIViewContentModeScaleAspectFill;
    [self.view addSubview:imgView];
    
    
    UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 50, 30)];
    btn.backgroundColor=[UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

 

    // Do any additional setup after loading the view.
}



-(void)btnClick:(UIButton*)sender{
 
    ImageCutTool * cut=[ImageCutTool new];
    cut.marqueeType=MarqueeTypeRound;
    cut.marqueeW=200;
    cut.originImage=[UIImage imageNamed:@"111.jpg"];
    [self presentViewController:cut animated:NO completion:nil];
    cut.block=^(UIImage * image){
        
        NSData *data = UIImagePNGRepresentation(image);
        NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"newClip.png"];
        
        //10.写到电脑桌面上
        path=@"/Users/wdx/Desktop/screenShot.jpg";
        [data writeToFile:path atomically:YES];
        
        UIImageView * imgView=[self.view viewWithTag:101];
        imgView.image=image;
        
        
    };
    
    
    
    

}




@end
