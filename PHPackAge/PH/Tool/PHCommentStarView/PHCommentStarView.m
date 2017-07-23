//
//  PHCommentStarView.m
//  PHPackAge
//
//  Created by wdx on 2017/3/13.
//  Copyright © 2017年 wdx. All rights reserved.
//  

#import "PHCommentStarView.h"
#import "UIImage+Helper.h"
#import "UIViewAdditions.h"

#pragma mark -- PHCommentStarViewSet
@interface PHCommentStarView()

@property (nonatomic,assign)CommentStarType commentStarType;

@property (nonatomic,assign)CGFloat longOfSide;
@property (nonatomic,assign)CGFloat spaceOfItem;

@property (nonatomic,assign)NSInteger maxRank;
@property (nonatomic,strong)NSString * normalImg;
@property (nonatomic,strong)NSString * heightImg;
@end

@implementation PHCommentStarView
-(NSInteger)maxRank{
    if (!_maxRank) {
        _maxRank=5;
    }
    return _maxRank;
}
-(CGFloat)longOfSide{
    if (!_longOfSide) {
        _longOfSide=20;
    }
    return _longOfSide;
}
-(CGFloat)spaceOfItem{
    if (!_spaceOfItem) {
        _spaceOfItem=5;
    }
    return _spaceOfItem;
}
-(void)setCurrentRank:(NSInteger)currentRank{
    if (_block) {
        _block(currentRank);
    }
    [self reshView:currentRank];
}
-(void)setCommentStarType:(CommentStarType)commentStarType{
    _commentStarType=commentStarType;
    
    self.userInteractionEnabled=_commentStarType==commentStarTypeSet;
    for (UIButton * btn in self.subviews) {
        if (_commentStarType==commentStarTypeSet) {
            btn.userInteractionEnabled=YES;
        }else{
            btn.userInteractionEnabled=NO;
        }
    }
}


+(instancetype)insWithMaxRank:(NSInteger)maxRank  normalImg:(NSString *)normalImg heightImg:(NSString *)heightImg commentStarType:(CommentStarType)commentStarType{
    PHCommentStarView * commentView = [PHCommentStarView new];
    commentView.maxRank=maxRank;
    commentView.normalImg=normalImg;
    commentView.heightImg=heightImg;
    commentView.commentStarType=commentStarType;
    commentView.size=CGSizeMake(commentView.maxRank*(commentView.longOfSide+commentView.spaceOfItem)-commentView.spaceOfItem, commentView.longOfSide);

    [commentView newView];
    return commentView;
}
-(void)newView{

    CGFloat setY=0;
    for (int i = 0 ; i < self.maxRank; i ++) {
        CGFloat bx = i * (self.longOfSide + self.spaceOfItem);
        
        UIButton * starBtn = [[UIButton alloc]initWithFrame:CGRectMake(bx, 0, self.longOfSide , self.longOfSide)];
        [self addSubview:starBtn];
        starBtn.userInteractionEnabled=self.commentStarType==commentStarTypeSet;
        setY=starBtn.right;
        
        starBtn.tag=100+i;
        
        [starBtn setBackgroundImage:[UIImage ImageForColor:[UIColor redColor]] forState:UIControlStateSelected];
        [starBtn setBackgroundImage:[UIImage ImageForColor:[UIColor grayColor]] forState:UIControlStateNormal];
        
        [starBtn addTarget:self action:@selector(starBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    UIPanGestureRecognizer  * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
}
-(void)pan:(UIGestureRecognizer *)ges{
    CGPoint point = [ges locationInView:ges.view];
    if (point.x>0) {
        for (UIButton * btn in self.subviews) {
            if (CGRectContainsPoint(btn.frame, point)) {
                [self reshView:btn.tag-100];
            }
        }
    }
}

-(void)starBtnEvent:(UIButton *)sender{
    self.currentRank=sender.tag-100;
}

-(void)reshView:(NSInteger)currentRank{
    for (UIButton * btn in self.subviews) {
        if (btn.tag<=currentRank+100) {
            btn.selected=YES;
        }else{
            btn.selected=NO;
        }
    }
}

@end
