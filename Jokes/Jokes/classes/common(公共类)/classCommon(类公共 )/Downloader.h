//
//  Downloader.h
//  Jokes
//
//  Created by qianfeng on 16/11/28.
//  Copyright © 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Downloader : NSObject

+ (void)downloaderWithURLString:(NSString *)urlString success:(void(^)(NSData *data))finishBlock fail:(void(^)(NSError *error))failBlock;

@end
