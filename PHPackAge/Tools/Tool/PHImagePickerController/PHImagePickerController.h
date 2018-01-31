//
//  PHImagePickerController.h
//  PHPackAge
//
//  Created by penghui on 2017/12/17.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PHImagePickerController : UIImagePickerController
@property (nonatomic,strong)void(^block)(UIImage *image);
@end
