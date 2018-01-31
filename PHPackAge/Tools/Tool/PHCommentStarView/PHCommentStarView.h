//
//  PHCommentStarView.h
//  PHPackAge
//
//  Created by wdx on 2017/3/13.
//  Copyright © 2017年 wdx. All rights reserved.
//  

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger ,CommentStarType){
    commentStarTypeSet,
    commentStarTypeGet,
};


#pragma mark -- PHCommentStarViewSet
@interface PHCommentStarView : UIView
@property (nonatomic,assign)NSInteger currentRank;
@property (nonatomic,strong)void(^block)(NSInteger currentRank);
+(instancetype)insWithMaxRank:(NSInteger)maxRank normalImg:(NSString *)normalImg heightImg:(NSString *)heightImg commentStarType:(CommentStarType)commentStarType;
@end


