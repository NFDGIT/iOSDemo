//
//  IMViewController.m
//  PHPackAge
//
//  Created by penghui on 2018/6/12.
//  Copyright © 2018年 wdx. All rights reserved.
//

#import "IMViewController.h"

#import "IMMessageModel.h"

#import "PHSocketTool.h"

@interface IMViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic,strong)NSMutableArray * datas;

@property (nonatomic,strong)UITableView * tableView;
@end

@implementation IMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
    
    [PHSocketTool share].newMsgBlock = ^(NSString *msg) {
        [_datas addObject:[[IMMessageModel alloc]initWithContent:msg type:IMMessageTypeOther]];
        [_tableView reloadData];
    };

    // Do any additional setup after loading the view.
}
-(void)initData{
    
    
    _datas = [NSMutableArray array];

    [IQKeyboardManager sharedManager].keyboardDistanceFromTextField = 20;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    

}
-(void)initUI{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    [self.view addSubview:scrollView];
    
    UIView * messageView = [self messgaeView];
    [scrollView addSubview:messageView];
    messageView.bottom = scrollView.height;
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width,scrollView.height - messageView.height) style:UITableViewStyleGrouped];
    [scrollView addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    scrollView.contentSize = CGSizeMake(scrollView.width, scrollView.height);
    
}

-(UIView *)messgaeView
{
    
    UIView * footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 50)];
    footer.backgroundColor = [UIColor whiteColor];
    UITextField * tf = [[UITextField alloc]initWithFrame:CGRectMake(10, 5, footer.width-20, footer.height-10)];
    tf.layer.cornerRadius = 4;
    tf.layer.borderWidth = 0.5;
    tf.layer.borderColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0.8].CGColor;
    [footer addSubview:tf];
    tf.delegate = self;
    
    return footer;
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

#pragma mark -- delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _datas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    IMMessageModel * model  = _datas[indexPath.section];
    
    NSString * content = model.content;
    IMMessageType  type = model.type;
    
    cell.textLabel.text = content;
    if (type == IMMessageTypeMe) {
        cell.textLabel.textAlignment = NSTextAlignmentRight;
    }else{
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
    }
    
    return cell;
}
#pragma mark -- tf delegate3
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [[PHSocketTool share] senderMsg:textField.text];
    
    
    
    [_datas addObject:[[IMMessageModel alloc]initWithContent:textField.text type:IMMessageTypeMe]];
    textField.text = @"";
    [_tableView reloadData];
    _tableView.contentOffset = CGPointMake(0, _tableView.contentSize.height - _tableView.height);

    
    return YES;
}
@end
