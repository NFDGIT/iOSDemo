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




@interface DemoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableDictionary * heightDic;


@property (nonatomic,strong)UITableView * tableView;


@property (nonatomic,strong)PHRishShowWebView * rishWeb;
@end

@implementation DemoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _heightDic = [NSMutableDictionary dictionary];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    [_tableView registerClass:[DemoTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    
//
//    UITextField * tf = [[UITextField alloc]initWithFrame:CGRectMake(100, 200, 300, 20)];
//    tf.backgroundColor = [UIColor lightGrayColor];
//    tf.delegate = self;
//    [self.view addSubview:tf];
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
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    NSLog(@"%@",textField.selectedTextRange);
    UITextRange * _textRange = textField.selectedTextRange;
    UITextRange * _markRange = textField.markedTextRange;

//     NSRange  * currentRange = textField.selectedRange ;
   NSUInteger   _inputLength = abs((int)[textField offsetFromPosition:_markRange.start toPosition:_markRange.end]);
   NSUInteger   _inputLocation = abs((int)[textField offsetFromPosition:textField.beginningOfDocument toPosition:_markRange.start]);
    
     NSRange inputRange = NSMakeRange(_inputLocation, _inputLength);
    return YES;
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
