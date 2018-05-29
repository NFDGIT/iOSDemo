//
//  DemoViewController.m
//  PHPackAge
//
//  Created by penghui on 2018/1/3.
//  Copyright © 2018年 wdx. All rights reserved.
//

#import "DemoViewController.h"
#import "PHRishShowWebView.h"
#import "DemoTableViewCell.h"

#import "base64.h"
#include <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>




@interface DemoViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)NSMutableDictionary * heightDic;


@property (nonatomic,strong)UITableView * tableView;


@property (nonatomic,strong)UITextField * tf;
@property (nonatomic,strong)PHRishShowWebView * rishWeb;
@end

@implementation DemoViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    NSLog(@"%@",[self setEncryption:@"1234567890"]);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//    _heightDic = [NSMutableDictionary dictionary];
//
//    self.view.backgroundColor = [UIColor whiteColor];
//
//
//    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
//    [self.view addSubview:_tableView];
//    [_tableView registerClass:[DemoTableViewCell class] forCellReuseIdentifier:@"cell"];
//
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
    
    
    
//
    self.view.backgroundColor =[UIColor whiteColor];
    
    UITextField * tf = [[UITextField alloc]initWithFrame:CGRectMake(100, 200, 300, 20)];
    tf.backgroundColor = [UIColor lightGrayColor];
    tf.delegate = self;
    [self.view addSubview:tf];
    _tf = tf;
    
    
    UIButton * btn= [[UIButton alloc]initWithFrame:CGRectMake(100, 240, 40, 30)];
    btn.backgroundColor =[UIColor redColor];
    
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
//
//   PHRishShowWebView * webView = [[PHRishShowWebView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height- 200)];
//    _rishWeb = webView;
//
//    [self.view addSubview:webView];
//    [webView loadHTMLString:@"<html><head><meta name='viewport' content='width=device-width'/></head><body> <script>document.write('helel');</script></body></html>" baseURL:nil];
//
//
//    UIButton * getBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, webView.frame.origin.y + webView.frame.size.height, 50, 30)];
//    [getBtn addTarget:self action:@selector(getBtnClik:) forControlEvents:UIControlEventTouchUpInside];
//    getBtn.backgroundColor = [UIColor redColor];
//    [self.view addSubview:getBtn];
//
    
    
    // Do any additional setup after loading the view.
}

-(void)btnClick{
    [self setEncryption:_tf.text];
}
#pragma mark -- delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView cellHeightWithIndexPath:indexPath];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DemoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.indexPath = indexPath;
    NSArray * titles = @[@"dkajdfajldfkjaslkfjdsklafjlkdsajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"ajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"dkajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"dkajdfajldfkjaslkfjdsklafjlkdsajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"ajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"dkajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"dkajdfajldfkjaslkfjdsklafjlkdsajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"ajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkafajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkafajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkafajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkafajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"dkajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"dkajdfajldfkjaslkfjdsklafjlkdsajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"ajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"dkajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"dkajdfajldfkjaslkfjdsklafjlkdsajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"ajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"dkajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"dkajdfajldfkjaslkfjdsklafjlkdsajfkldsjafajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"dkajdfajldfkjaslkfjdsklafjlkdsajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"ajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"dkajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf",
                         @"dkajdfajldfkjaslkfjdsklafjlkdsajfkldsjafajfkldsjaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaflkdjsalkfdjlkasjfdlksajflkdjsalkfjdslkajfdlksajflkdjsalkfjdslkaf"];
  
    cell.title = titles[indexPath.section];
    

    
    
    __block typeof(cell) weakCell  = cell;
    cell.loadImgFinish = ^{
        
        
        CGFloat height = weakCell.frame.size.height ;
        
        CGFloat newHeight = [tableView cellHeightWithIndexPath:indexPath];
        if (height != [tableView cellHeightWithIndexPath:indexPath]) {
             [tableView reloadData];
        }
//        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
//        [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationTop];
       
    };
    return cell;
    
    
}




//-(void)setHeight:(CGFloat)height indexPath:(NSIndexPath *)indexPath{
//    NSString * key = [NSString stringWithFormat:@"%ld,%ld",(long)indexPath.section,(long)indexPath.row];
//    [_heightDic setValue:@(height) forKey:key];
//}
//-(CGFloat)heightWithIndexPath:(NSIndexPath *)indexPath{
//    NSString * key = [NSString stringWithFormat:@"%ld,%ld",(long)indexPath.section,(long)indexPath.row];
//    CGFloat height = [[NSString stringWithFormat:@"%@",[_heightDic valueForKey:key]] floatValue];
//    return height;
//}





-(void)getBtnClik:(UIButton *)sender{
    
    NSString * string = @"<img  src='https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515063187180&di=3b5e4248e411a09eea318310e3a718df&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F9345d688d43f87947d4e90edd81b0ef41ad53a44.jpg'></img>";
    [_rishWeb evaluateJavaScript:string completionHandler:^(id _Nullable data, NSError * _Nullable error) {
        
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
    // Dispose of any resources that can be recreated.
}


#pragma mark -- textField delegate
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
////    NSLog(@"%@",textField.selectedTextRange);
//    UITextRange * _textRange = textField.selectedTextRange;
//    UITextRange * _markRange = textField.markedTextRange;
//
////     NSRange  * currentRange = textField.selectedRange ;
//   NSUInteger   _inputLength = abs((int)[textField offsetFromPosition:_markRange.start toPosition:_markRange.end]);
//   NSUInteger   _inputLocation = abs((int)[textField offsetFromPosition:textField.beginningOfDocument toPosition:_markRange.start]);
//
//     NSRange inputRange = NSMakeRange(_inputLocation, _inputLength);
//    return YES;
//}

#pragma mark - 产生安全码
-(NSString *)setEncryption:(NSString *)secret
{
    
    
    
    
    
    
    
    NSString *result = [[NSString alloc]init];
    
    
    long timeInt = 60 * 60 * 24 * 365 * 10 + 2 * (60 * 60 * 24) + 3;
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:timeInt];
    
    NSLog(@"dat===========%@",dat);
    
    

  //   1， //    年月日时分  拼 16位  前补 0
  //   2,  //    
    
    NSTimeInterval a=[dat timeIntervalSince1970]/60;
    int ass = a;
   
    
    uint64_t counter = (uint64_t)ass * 60000;
    // 从1970 到现在 有 多少毫秒
    

//    counter = 56789;
    
    
    NSString *string1 = [[NSString alloc]init];
    
    for (NSInteger i = 7; i >= 0; i--) {
        
        NSString *string2 =[NSString stringWithFormat:@"%llu",(counter & 0xff)];

        string1 = [string1 stringByAppendingString:string2];
        
        counter >>= 8;
    }
    
    
    
    
    NSString *str2 = [self HmacSha1:secret data:string1];
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(NSUTF16BigEndianStringEncoding);
    
    NSData *data = [str2 dataUsingEncoding:enc];
    
    Byte* byte = (Byte *)[data bytes];
    
    int offset = byte[data.length - 1] & 0xf;
    
    int binary = byte[offset * 2 + 1] << 24;
    
    int as = binary % 1000000;
    
    result = [NSString stringWithFormat:@"%d",(as*(1 - ((as >> 31)<<1)))];
    
    while (result.length < 6) {
        result = [NSString stringWithFormat:@"0%@",result];
    }
    
    return result;
    
}

-(NSString *)HmacSha1:(NSString *)key data:(NSString *)data
{
    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];
    //Sha256:
    // unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    //CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    //sha1
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC
                                          length:sizeof(cHMAC)];
    
    NSString *hash = [HMAC base64EncodedStringWithOptions:0];//将加密结果进行一次BASE64编码。
    return hash;
}

- (NSString *)hexStringFromString:(NSString *)string{
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
        
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
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
