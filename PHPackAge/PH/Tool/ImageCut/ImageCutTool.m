//
//  ImageCutTool.m
//  PHPackAge
//
//  Created by wdx on 16/8/26.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "ImageCutTool.h"

@interface ImageCutTool ()
@property (nonatomic,strong)UIView * marquee1;
@property (nonatomic,strong)UIImageView * originImgView;

@end

@implementation ImageCutTool
-(instancetype)init{
    if (self=[super init]) {
        _marqueeW=200;
        _marqueeType=0;
        [self newView];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

-(void)setMarqueeW:(CGFloat)marqueeW{
    _marqueeW=marqueeW;
    _marquee1.layer.borderWidth=Vheight-_marqueeW/2;
}
-(void)setMarqueeType:(MarqueeType)marqueeType{
    _marqueeType=marqueeType;
    if (_marqueeType==MarqueeTypeRound) {
        _marquee1.layer.cornerRadius=_marquee1.width/2;
    }else{
        _marquee1.layer.cornerRadius=0;
    }
}
-(void)setOriginImage:(UIImage *)originImage{
    _originImage=originImage;
    _originImgView.image=originImage;
    _originImgView.width=Vwidth;
    _originImgView.height=Vwidth/originImage.size.width * originImage.size.height;
    _originImgView.top=(Vheight-_originImgView.height)/2;
    
}

-(void)newView{
    UIView * bgView=[[UIView alloc]initWithFrame:self.view.frame];
    bgView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:bgView];
    bgView.tag=100;
    
    
    UIPanGestureRecognizer * pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    UIPinchGestureRecognizer * pin=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pin:)];
    
    
    _originImgView=[[UIImageView alloc]initWithFrame:self.view.frame];
    _originImgView.contentMode=UIViewContentModeScaleAspectFit;
    _originImgView.image=_originImage;
    _originImgView.userInteractionEnabled=YES;
    [self.view addSubview:_originImgView];
    _originImgView.tag=101;
    
    [_originImgView addGestureRecognizer:pan];
    [_originImgView addGestureRecognizer:pin];
    
    
    
    _marquee1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, Vheight*2, Vheight*2)];
    _marquee1.center=[UIApplication sharedApplication].delegate.window.center;
    _marquee1.backgroundColor=[UIColor clearColor];
    _marquee1.layer.borderColor=[UIColor colorWithRed:.0 green:.0 blue:.0 alpha:.7].CGColor;
    _marquee1.layer.borderWidth=Vheight-_marqueeW/2;
    _marquee1.tag=102;
    [self.view addSubview:_marquee1];
    [self changeMarqueeShap];
    
    _marquee1.userInteractionEnabled=NO;
    
    //    [_marquee1 addGestureRecognizer:pan];
    
    
    
    UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 50, 30)];
    btn.tag=103;
    [btn setTitle:@"保存" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(saveOrCancel:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton * changeShap=[[UIButton alloc]initWithFrame:btn.frame];
    changeShap.width=changeShap.width*2;
    changeShap.centerX=self.view.centerX;
    changeShap.tag=104;
    [changeShap setTitle:@"切换形状" forState:UIControlStateNormal];
    [changeShap setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [changeShap addTarget:self action:@selector(saveOrCancel:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeShap];
    
    
    UIButton * cancelBtn=[[UIButton alloc]initWithFrame:CGRectMake(Vwidth-10-btn.width, btn.top, btn.width, btn.height)];
    cancelBtn.width=btn.width;
//    cancelBtn.right=100;
    
    cancelBtn.tag=105;
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(saveOrCancel:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
    
}
-(void)changeMarqueeShap{
    if (_marqueeType==MarqueeTypeRound) {
        _marquee1.layer.cornerRadius=_marquee1.width/2;
    }else{
        _marquee1.layer.cornerRadius=0;
    }
    
}
-(void)pin:(UIPinchGestureRecognizer *)pin{
    pin.view.transform = CGAffineTransformScale(pin.view.transform,pin.scale,pin.scale);
    pin.scale = 1;
    if (pin.state==UIGestureRecognizerStateEnded) {
        if (pin.view.transform.a<1||pin.view.transform.d<1) {
            [UIView animateWithDuration:0.25 animations:^{
                pin.view.transform=CGAffineTransformIdentity;
                pin.view.frame=CGRectMake(0, (Vheight-_originImgView.height)/2, Vwidth, Vwidth/_originImage.size.width * _originImage.size.height);
                pin.view.center=[UIApplication sharedApplication].delegate.window.center;
            }];
        }
        else{
            [self changeFrameForGestureView:pin.view];
        }
    }
    
}
-(void)pan:(UIPanGestureRecognizer *)pan{
    CGFloat w;// =_marquee1.width- _marquee1.layer.borderWidth*2;
    w=_marqueeW;
    
    CGPoint translation = [pan translationInView:self.view];
    pan.view.center = CGPointMake(pan.view.center.x+translation.x,pan.view.center.y+translation.y);
    [pan setTranslation:CGPointZero inView:self.view];
    if (pan.state==UIGestureRecognizerStateEnded) {
        [self changeFrameForGestureView:pan.view];
    }
}
//调整手势view的frame
-(void)changeFrameForGestureView:(UIView *)view{
    CGRect frame=view.frame;
    
    if (frame.origin.x>_marquee1.centerX-_marqueeW/2) {
        frame.origin.x=_marquee1.centerX-_marqueeW/2;
    }
    if (frame.origin.y>_marquee1.centerY-_marqueeW/2) {
        frame.origin.y=_marquee1.centerY-_marqueeW/2;
    }
    if (CGRectGetMaxX(frame)<_marquee1.centerX+_marqueeW/2) {
        frame.origin.x=frame.origin.x+(_marqueeW+(Vwidth-_marqueeW)/2-CGRectGetMaxX(frame));
    }
    if (CGRectGetMaxY(frame)<(_marquee1.centerY+_marqueeW/2)) {
        frame.origin.y=frame.origin.y+(_marqueeW+(Vheight-_marqueeW)/2-CGRectGetMaxY(frame));
    }
    [UIView animateWithDuration:0.25 animations:^{
        view.frame=frame;
    }];
    
}


-(void)saveOrCancel:(UIButton *)sender{
    
    if (sender.tag==104) {
        _marqueeType++;
        if (_marqueeType>1) {
            _marqueeType=0;
        }
        [self changeMarqueeShap];
        return;
    }
    if (sender.tag==105) {
        [self dismissViewControllerAnimated:NO completion:nil];
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }

    //1.加载原图
    
    UIImage *oldImage= self.originImage;
    
    CGFloat w =_marquee1.width- _marquee1.layer.borderWidth*2;
    CGFloat h=w;
    
    CGFloat x=_marquee1.centerX-w/2;
    CGFloat y=_marquee1.centerY-h/2;
  
    
    UIImage *newImage ;
    
    UIImageView * oldImgView=_originImgView;
    oldImgView.image=oldImage;
    newImage =[self getImageFromImageView:_originImgView withRect:CGRectMake(x, y, w, h)];
    UIGraphicsBeginImageContext(CGSizeMake(newImage.size.width, newImage.size.height));
    CGContextRef ctx= UIGraphicsGetCurrentContext();
    if (_marqueeType==MarqueeTypeRect) {
        
    }else{
        CGContextAddArc(ctx, newImage.size.width/2, newImage.size.height/2, newImage.size.width/2, 0, M_PI*2, 0);
        CGContextClip(ctx);
    }
    [newImage drawInRect:CGRectMake(0, 0, newImage.size.width, newImage.size.height)];
    newImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    if (_block) {
        _block(newImage);
    }
    [self dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 图片裁剪
//裁剪修改后的图片
-(UIImage *)getImageFromImageView:(UIImageView *)imageView withRect:(CGRect)rect{
    CGFloat scale= imageView.image.size.width/Vwidth;
   
    CGRect subRect=[self.view convertRect:rect toView:imageView];
    
    subRect=CGRectMake(subRect.origin.x * scale, subRect.origin.y *scale, subRect.size.width *scale, subRect.size.height * scale);
   
    //把图片  原来的分辨率  调整为跟view大小一致的分辨率
    UIImage *changedImage=[self createChangedImageWithImageView:imageView];
    //因 本工具要处理的图片 是直接从屏幕上截下来的所以不需要处理
   changedImage =imageView.image;
    
    
    UIGraphicsBeginImageContext(subRect.size);
    
    [changedImage drawInRect:CGRectMake(-subRect.origin.x,-subRect.origin.y,changedImage.size.width,changedImage.size.height)];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

//创建修改后的图片
-(UIImage *)createChangedImageWithImageView:(UIImageView *)imageView{
    //把图片  原来的分辨率  调整为跟view大小一致的分辨率
    
    //因 本工具要处理的图片 是直接从屏幕上截下来的所以不需要处理
    
    CGSize size=imageView.bounds.size;
    //    size=CGSizeMake(imageView.bounds.size.width*.5, imageView.bounds.size.height*.5);
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [imageView.layer renderInContext:context];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}


@end
