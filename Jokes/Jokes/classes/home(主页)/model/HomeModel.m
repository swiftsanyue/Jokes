//
//  HomeModel.m
//  Jokes
//
//  Created by qianfeng on 16/11/28.
//  Copyright © 2016年 ZL. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

@end

@implementation HomeData

@end

@implementation Menu

@end

@implementation MenuData

@end

@implementation MenuShowData

@end

@implementation MenuComments

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"commentId":@"id",@"Description":@"description"}];
}

@end

@implementation MenuGroup

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"groupId":@"id",@"video360p":@"360p_video",@"video480p":@"480p_video",@"video720p":@"720p_video"}];
}

@end

@implementation MenuDislike_reason

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"DislikeId":@"id"}];
}

@end

@implementation MenuLargeImage

@end

@implementation LargeImageUrl

@end

@implementation MenuUser

@end

@implementation MenuGitVideo

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"video360p":@"360p_video",@"video480p":@"480p_video",@"video720p":@"720p_video"}];
}

@end



