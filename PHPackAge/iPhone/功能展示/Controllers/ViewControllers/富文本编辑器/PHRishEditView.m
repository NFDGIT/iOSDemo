//
//  PHRishEditView.m
//  PHPackAge
//
//  Created by penghui on 2017/12/17.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import "PHRishEditView.h"
#import "PHImagePickerController.h"


@interface PHRishEditView()

@end
@implementation PHRishEditView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self initData];
        [self initUI];
        [self layoutCellView];
    }
    return self;
}
-(void)setDatas:(NSMutableArray *)datas{
    _datas = datas;
    [self initUI];
    [self layoutCellView];
}
-(void)initData{
    _datas = [NSMutableArray array];
    
//    for (int i = 0; i < 10; i ++) {
//        PHRishEditModel * model;
//        if (i % 2 == 0 ) {
//            model = [[PHRishEditModel alloc]initWithCellType:PHRishEditCellViewTypeText content:@"hello"];
//        }
//        else
//        {
//            model = [[PHRishEditModel alloc]initWithCellType:PHRishEditCellViewTypeImg content:@"http://img.wanchezhijia.com/A/2015/5/6/9/48/c6344b4e-07a8-48a4-b5b9-b08cc7269d62.jpg"];
//        }
//        [_datas addObject:model];
//    }
//
   
    [_datas addObject:[[PHRishEditModel alloc]initWithCellType:PHRishEditCellViewTypeText content:@""]];

    [self initUI];
}
-(void)initUI{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    self.backgroundColor = [UIColor whiteColor];

    
    for (int i = 0; i < _datas.count; i ++) {
        PHRishEditModel * model = _datas[i];
        
     
        
        
        if (model.cellType == PHRishEditCellViewTypeText) {
           PHRishEditTextCellView * textView  = [[PHRishEditTextCellView alloc]initWithFrame:CGRectMake(0, 0, self.width, 20)];
            [self addSubview:textView];
            textView.model = model;
            textView.row = i;
            if (_datas.count == 1) {
                textView.placeHolder = @"请输入正文内容";
            }
            
            textView.textChange = ^(NSString * text,NSUInteger row) {
                [self layoutCellView];
                [self replaceTextOfDatasWithRow:row text:text];
            };
            textView.insert = ^(NSUInteger row, NSUInteger btnTag, NSString *currentWillReplaceText, NSString *nextInsertText) {
                if (btnTag == 100) {// 图片
                    PHImagePickerController * imgPikcer =[PHImagePickerController new];
                    imgPikcer.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    [((UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController) presentViewController:imgPikcer animated:YES completion:^{
                    }];
                    imgPikcer.block = ^(UIImage *image) {
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{// 模拟网络请求
                            [self insertImgAndText:row imgUrl:@"http://img.wanchezhijia.com/A/2015/5/6/9/48/c6344b4e-07a8-48a4-b5b9-b08cc7269d62.jpg" currentWillReplaceText:currentWillReplaceText nextInsertText:nextInsertText];
                            
                     
                            
                            
                        });
                        
                        
                    };
                    
                }else{// 商品
                       [self insertImgAndText:row imgUrl:@"http://img.wanchezhijia.com/A/2015/5/6/9/48/c6344b4e-07a8-48a4-b5b9-b08cc7269d62.jpg" currentWillReplaceText:currentWillReplaceText nextInsertText:nextInsertText];
                    
                }
            };
//            textView.insertImg = ^(NSUInteger row, NSString *imgUrl, NSString *currentWillReplaceText, NSString *nextInsertText) {
//                [self replaceTextOfDatasWithRow:row text:currentWillReplaceText];
//                [self insertImgCell:row+1 img:imgUrl];
//                [self insertTextCell:row + 2 text:nextInsertText];
//                [self initUI];
//                [self layoutCellView];
//                [self becomeTextCellFirstResponseWithRow:row+2];
//                [self moveCursorToLocation:0 row:row +2];
//            };
            
            
            textView.clearAtFirstPlace = ^(NSUInteger row) {
                [self textCellClearClickAtFirstPlaceAtRow:row];
            };
           
        }
        if (model.cellType == PHRishEditCellViewTypeImg) {
            PHRishEditImgCellView * imgView  = [[PHRishEditImgCellView alloc]initWithFrame:CGRectMake(0, 0, self.width, 100)];
            imgView.row = i;
            [self addSubview:imgView];
            imgView.model = model;
          
        }
    }

}
-(void)layoutCellView{
    
    CGFloat setY = 0;
    
    for (int i = 0;  i < self.subviews.count; i ++) {
        UIView * cellView = self.subviews[i];
        cellView.top = setY;
        
//        cellView.top = 100;
        setY = cellView.bottom;
    }

    self.height = setY;
    
    if (self.heightChange) {
        self.heightChange(self.height);
    }
}
#pragma mark -- 数据 的操作  以及界面的刷新
/** 替换datas 中的文字 */
-(void)replaceTextOfDatasWithRow:(NSInteger )row text:(NSString *)text{
    PHRishEditModel * model = _datas[row];
    model.content = text;
    [_datas replaceObjectAtIndex:row withObject:model];
    NSLog(@"%ld------ : %@",(long)row,model.content);
}

/** 插入文字 */
-(void)insertTextCell:(NSUInteger)row text:(NSString *)text{
    PHRishEditModel * model = [[PHRishEditModel alloc]initWithCellType:PHRishEditCellViewTypeText content:text];
    [_datas insertObject:model atIndex:row];

}
/** 插入一张图片 （链接） */
-(void)insertImgCell:(NSUInteger)row img:(NSString *)imgUrl{
    PHRishEditModel * model = [[PHRishEditModel alloc]initWithCellType:PHRishEditCellViewTypeImg content:imgUrl];
    [_datas insertObject:model atIndex:row];

}
/**  */
-(void)insertImgAndText:(NSUInteger)row imgUrl:(NSString *)imgUrl currentWillReplaceText:(NSString *)currentWillReplaceText nextInsertText:(NSString *)nextInsertText{
    
    
    [self replaceTextOfDatasWithRow:row text:currentWillReplaceText];
    [self insertImgCell:row+1 img:imgUrl];
    [self insertTextCell:row + 2 text:nextInsertText];
    [self initUI];
    [self layoutCellView];
    [self becomeTextCellFirstResponseWithRow:row+2];
    [self moveCursorToLocation:0 row:row +2];
}



/** 以特定下表找到 对应的的cell  如果 为文字 则 将其 置为第一相应 */
-(void)becomeTextCellFirstResponseWithRow:(NSUInteger)row{
    PHRishEditTextCellView * textCell = self.subviews[row];
    if ([textCell isKindOfClass:[PHRishEditTextCellView class]]) {
        [textCell textViewbecomeFirstResponse];
    }
}
/** 查看 某一行是 img还是text */
-(PHRishEditCellViewType )getCellTypeWithRow:(NSUInteger )row{
    PHRishEditModel * model = _datas[row];
    return model.cellType;
}
/** 删除 某一行 */
-(void)deleteRow:(NSUInteger)row{
    [_datas removeObjectAtIndex:row];
}
/** 把光标移动到 指定的位置 */
-(void)moveCursorToLocation:(NSUInteger )location row:(NSUInteger )row{
    PHRishEditTextCellView * cellView = self.subviews[row];
    if ([cellView isKindOfClass:[PHRishEditTextCellView class]]) {
        [cellView moveCursorToLocation:location];
    }
}
/** 当 textCell 的 光标在首位  并且点击删除键时 */
-(void)textCellClearClickAtFirstPlaceAtRow:(NSUInteger )row{
    if (row <= 0) {
        return;
    }
    /** 查看当前 cell 的文字内容 */
    PHRishEditModel * model = _datas[row];
    NSString * currentText = model.content;
    /** 查看前一个 cell 是什么类型*/
    PHRishEditModel * beforeModel = _datas[row -1];
    NSString * beforeText = beforeModel.content;
    PHRishEditCellViewType beforeCellType = beforeModel.cellType;
    
    if (beforeCellType == PHRishEditCellViewTypeImg) { // 如果 前一行是图片
        [self deleteRow:row - 1];
        [self initUI];
        [self layoutCellView];
        [self becomeTextCellFirstResponseWithRow:row-1];
        
        [self moveCursorToLocation:0 row:row-1];
    }else{// 如果 前一行是文字
        if(currentText.length == 0)// 如果当前行没有内容
        {
            [self deleteRow:row];
            [self initUI];
            [self layoutCellView];
            [self becomeTextCellFirstResponseWithRow:row - 1];
            
            
        }
        else  //  如果当前行有内容
        {
            
            // 把当前行的 文字 拼接到 上一行的后面  并把当前删除
            [self replaceTextOfDatasWithRow:row -1 text:[beforeModel.content stringByAppendingString:currentText]];
            [_datas removeObjectAtIndex:row];
            [self initUI];
            //  把光标移动到 拼接处
            [self layoutCellView];
            [self becomeTextCellFirstResponseWithRow:row-1];
            
            [self moveCursorToLocation:beforeText.length row:row-1];
//            [self deleteRow:row];
            
            
        }
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
