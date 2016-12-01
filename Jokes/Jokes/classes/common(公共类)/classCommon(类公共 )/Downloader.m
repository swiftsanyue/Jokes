//
//  Downloader.m
//  Jokes
//
//  Created by qianfeng on 16/11/28.
//  Copyright © 2016年 ZL. All rights reserved.
//

#import "Downloader.h"

@implementation Downloader

+ (void)downloaderWithURLString:(NSString *)urlString success:(void (^)(NSData *))finishBlock fail:(void (^)(NSError *))failBlock {
    //1.创建NSURL
    NSURL *url = [NSURL URLWithString:urlString];
    
    //2.创建request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //创建AFURLSessionManager对象
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    
    //设置返回的数据是二进制数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //下载对象
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error) {
            //请求失败
            failBlock(error);
        }else {
            //请求成功
            NSHTTPURLResponse *r = (NSHTTPURLResponse *)response;
            if (r.statusCode == 200) {
                //返回正确的数据
                finishBlock(responseObject);
            }else {
                //请求失败了
                NSError *e = [NSError errorWithDomain:urlString code:r.statusCode userInfo:@{@"msg":@"下载失败"}];
                failBlock(e);
            }
        }
    }];
    
    //5.开始下载
    [task resume];
    
    
}


@end
