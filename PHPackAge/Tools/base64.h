//
//  base64.h
//  Encryption
//
//  Created by 易商通 on 2017/6/20.
//  Copyright © 2017年 重庆普惠有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface base64 : NSObject





extern size_t EstimateBas64EncodedDataSize(size_t inDataSize);
extern size_t EstimateBas64DecodedDataSize(size_t inDataSize);

extern bool Base64EncodeData(const void *inInputData, size_t inInputDataSize, char *outOutputData, size_t *ioOutputDataSize, BOOL wrapped);
extern bool Base64DecodeData(const void *inInputData, size_t inInputDataSize, void *ioOutputData, size_t *ioOutputDataSize);

@end
