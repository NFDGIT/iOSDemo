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


#import "PHPackAge-Swift.h"


//#import "E_ScrollViewController.h"


#import "PHRishEditViewController.h"
#import "DemoViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/*
 * 视图属性
 */
@property (nonatomic,strong)UITableView * tableView;

/*
 * 数据属性
 */
@property (nonatomic,strong)NSArray * tableViewContentArray;



@property (nonatomic,strong)UIImageView * imgsource;
@property (nonatomic,strong)UIView * marquee;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initUI];
    
    

//    _imgsource=[[UIImageView alloc]initWithFrame:self.view.frame];
////    _imgsource.image=[UIImage imageNamed:@"111.jpg"];
//
//    [self.view addSubview:_imgsource];
//
//    UIImageView * imgView=[[UIImageView alloc]initWithFrame:CGRectMake(200, 400, 200, 200)];
//    imgView.center=self.view.center;
//    imgView.tag=101;
//    imgView.contentMode=UIViewContentModeScaleAspectFill;
//    [self.view addSubview:imgView];
//
//
//    UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 50, 30)];
//    btn.backgroundColor=[UIColor redColor];
//    [self.view addSubview:btn];
//    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

 

    // Do any additional setup after loading the view.
}
-(void)initData{

    _tableViewContentArray = @[@[@{@"img":@"",@"title":@"富文本编辑器",@"controller":NSStringFromClass([PHRishEditViewController class])},
                                 @{@"img":@"",@"title":@"小说",@"controller":@"noPush"},
                                @{@"img":@"",@"title":@"demo",@"controller":NSStringFromClass([DemoViewController class])}]];
    
}
-(void)initUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource =self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    

    
}

#pragma mark -- tableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * cellArray = _tableViewContentArray[section];
    return cellArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _tableViewContentArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray * cellArray = _tableViewContentArray[indexPath.section];
    NSDictionary * cellDic = cellArray[indexPath.row];
    cell.textLabel.text  = [NSString stringWithFormat:@"%@",cellDic[@"title"]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * cellArray = _tableViewContentArray[indexPath.section];
    NSDictionary * cellDic = cellArray[indexPath.row];
    NSString * controllString = [NSString stringWithFormat:@"%@",cellDic[@"controller"]];

    
    if ([controllString hasPrefix:@"noPush"]) {
        

        
        
//        let url = [Bundle.main.url(forResource: "求魔", withExtension: "txt")
        

//        DZMReadParser.ParserLocalURL(url: url!) {[weak self] (readModel) in
//
//            MBProgressHUD.hide()
//
//            let readController = DZMReadController()
//
//            readController.readModel = readModel
//
//            /// 是否开启长按内容显示菜单 默认: true
//            // readController.openLongMenu = false
//
//            self?.navigationController?.pushViewController(readController, animated: true)
//        }
        
//        ReaViewController * read = [ReaViewController new];
//
//        NSURL * url = [[NSBundle mainBundle] URLForResource:@"" withExtension:@"txt"];
        

        
//        ReaViewController * rea = [ReaViewController new];
//        rea

        
//        [self.navigationController pushViewController:read animated:YES];
//        []
        
    }else{
        UIViewController * controller = [NSClassFromString(controllString) new];
        [self.navigationController pushViewController:controller animated:YES];
        
    }
    


    
//    ViewController * view =[ViewController new];
//    [self presentViewController:view animated:YES completion:nil];
    
}

//-(void)btnClick:(UIButton*)sender{
//
//    ImageCutTool * cut=[ImageCutTool new];
//    cut.marqueeType=MarqueeTypeRound;
//    cut.marqueeW=200;
//    cut.originImage=[UIImage imageNamed:@"111.jpg"];
//    [self presentViewController:cut animated:NO completion:nil];
//    cut.block=^(UIImage * image){
//
//        NSData *data = UIImagePNGRepresentation(image);
//        NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"newClip.png"];
//
//        //10.写到电脑桌面上
//        path=@"/Users/wdx/Desktop/screenShot.jpg";
//        [data writeToFile:path atomically:YES];
//
//        UIImageView * imgView=[self.view viewWithTag:101];
//        imgView.image=image;
//
//
//    };
//
//
//
//
//
//}




@end
