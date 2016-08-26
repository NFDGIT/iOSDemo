//
//  ViewController.m
//  PHPackAge
//
//  Created by wdx on 16/7/7.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "ViewController.h"
#import "ScreenShotView.h"


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
    
    UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 50, 30)];
    btn.backgroundColor=[UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

 

    // Do any additional setup after loading the view.
}



-(void)btnClick:(UIButton*)sender{
 
    
    
    ScreenShotView * screenShot=[ScreenShotView new];
    screenShot.marqueeType=MarqueeTypeRect;
    screenShot.marqueeW=300;
    screenShot.originImage=[UIImage imageNamed:@"111.jpg"];
    
    
    [self.view addSubview:screenShot];
    screenShot.block=^(UIImage * image){
        
        NSData *data = UIImagePNGRepresentation(image);
        NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"newClip.png"];
        
        //10.写到电脑桌面上
        path=@"/Users/wdx/Desktop/screenShot.jpg";
        [data writeToFile:path atomically:YES];
        
        UIImageView * imgView=[[UIImageView alloc]initWithFrame:CGRectMake(200, 400, 200, 200)];
        imgView.image=image;
        imgView.contentMode=UIViewContentModeScaleAspectFill;
        [self.view addSubview:imgView];
        
    };
}




@end
