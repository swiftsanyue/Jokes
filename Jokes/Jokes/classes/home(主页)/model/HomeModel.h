//
//  HomeModel.h
//  Jokes
//
//  Created by qianfeng on 16/11/28.
//  Copyright © 2016年 ZL. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@class MenuData;
@class MenuLargeImage;
@class MenuUser;
@class MenuGitVideo;


@protocol HomeData;
@protocol MenuShowData;
@protocol MenuComments;
@protocol MenuDislike_reason;
@protocol LargeImageUrl;


@interface HomeModel : JSONModel

@property (nonatomic, strong)NSArray<Optional,HomeData> *data;
@property (nonatomic, copy)NSString<Optional> *message;

@end

@interface HomeData : JSONModel

@property (nonatomic, strong)NSNumber<Optional> *list_id;
@property (nonatomic, copy)NSString<Optional> *name;
@property (nonatomic, strong)NSNumber<Optional> *refresh_interval;
@property (nonatomic, strong)NSNumber<Optional> *type;
@property (nonatomic, copy)NSString<Optional> *recommend;
@property (nonatomic, copy)NSString<Optional> *url;

@end


//展示数据
@interface Menu : JSONModel

@property (nonatomic, strong)MenuData<Optional> *data;
@property (nonatomic, copy)NSString<Optional> *message;

@end

@interface MenuData : JSONModel

@property (nonatomic, strong)NSArray<Optional,MenuShowData> *data;
@property (nonatomic, assign)BOOL has_more;
@property (nonatomic, strong)NSNumber<Optional> *max_time;
@property (nonatomic, strong)NSNumber<Optional> *min_time;
@property (nonatomic, copy)NSString<Optional> *tip;

@end

@interface MenuShowData : JSONModel

@property (nonatomic, strong)NSArray<Optional,MenuComments> *comments;
@property (nonatomic, strong)NSNumber<Optional> *display_time;

@property (nonatomic, strong)NSNumber<Optional> *group;

@property (nonatomic, strong)NSNumber<Optional> *online_time;
@property (nonatomic, strong)NSNumber<Optional> *type;

@end

//神评
@interface MenuComments : JSONModel

@property (nonatomic ,copy)NSString<Optional> *avatar_url;
@property (nonatomic, strong)NSNumber<Optional> *bury_count;
@property (nonatomic, strong)NSNumber<Optional> *comment_id;
@property (nonatomic, strong)NSNumber<Optional> *create_time;
@property (nonatomic ,copy)NSString<Optional> *Description;
@property (nonatomic, strong)NSNumber<Optional> *digg_count;
@property (nonatomic, strong)NSNumber<Optional> *group_id;
@property (nonatomic, strong)NSNumber<Optional> *commentsId;
@property (nonatomic, strong)NSNumber<Optional> *is_digg;
@property (nonatomic, assign)BOOL is_pro_user;
@property (nonatomic ,copy)NSString<Optional> *platform;
@property (nonatomic ,copy)NSString<Optional> *platform_id;
@property (nonatomic, strong)NSNumber<Optional> *share_type;
@property (nonatomic ,copy)NSString<Optional> *share_url;
@property (nonatomic, strong)NSNumber<Optional> *status;
@property (nonatomic ,copy)NSString<Optional> *text;
@property (nonatomic, strong)NSNumber<Optional> *user_bury;
@property (nonatomic, strong)NSNumber<Optional> *user_digg;
@property (nonatomic, strong)NSNumber<Optional> *user_id;
@property (nonatomic, strong)NSNumber<Optional> *user_name;
@property (nonatomic, strong)NSNumber<Optional> *user_profile_image_url;
@property (nonatomic, strong)NSNumber<Optional> *user_profile_url;
@property (nonatomic, assign)BOOL user_verified;

@end

//内容
@interface MenuGroup : JSONModel

@property (nonatomic, copy)NSString<Optional> *activity;
@property (nonatomic, assign)BOOL allow_dislike;
@property (nonatomic, strong)NSNumber<Optional> *bury_count;
@property (nonatomic, strong)NSNumber<Optional> *category_id;
//搞笑囧图
@property (nonatomic ,copy)NSString<Optional> *category_name;
@property (nonatomic, strong)NSNumber<Optional> *category_type;
@property (nonatomic, assign)BOOL category_visible;
@property (nonatomic, strong)NSNumber<Optional> *comment_count;
@property (nonatomic ,copy)NSString<Optional> *content;
@property (nonatomic, strong)NSNumber<Optional> *create_time;
@property (nonatomic, strong)NSNumber<Optional> *digg_count;

@property (nonatomic, strong)NSArray<Optional,MenuDislike_reason> *dislike_reason;

@property (nonatomic, strong)NSNumber<Optional> *display_type;
@property (nonatomic, strong)NSNumber<Optional> *favorite_count;

@property (nonatomic, strong)NSNumber<Optional> *duration;
//视频
@property (nonatomic, strong)MenuGitVideo<Optional> *gifvideo;
@property (nonatomic, copy)NSString<Optional> *publish_time;
@property (nonatomic, strong)MenuLargeImage<Optional> *video360p;
@property (nonatomic, strong)MenuLargeImage<Optional> *video480p;
@property (nonatomic, strong)MenuLargeImage<Optional> *video720p;
@property (nonatomic, strong)NSNumber<Optional> *m3u8_url;
@property (nonatomic, copy)NSString<Optional> *mp4_url;
@property (nonatomic, strong)MenuLargeImage<Optional> *origin_video;
@property (nonatomic, strong)MenuLargeImage<Optional> *medium_cover;
@property (nonatomic, strong)MenuLargeImage<Optional> *large_cover;
@property (nonatomic, strong)NSNumber<Optional> *video_height;
@property (nonatomic, strong)NSNumber<Optional> *video_width;


@property (nonatomic, strong)NSNumber<Optional> *go_detail_count;
@property (nonatomic, strong)NSNumber<Optional> *group_id;
@property (nonatomic, strong)NSNumber<Optional> *has_comments;
@property (nonatomic, strong)NSNumber<Optional> *has_hot_comments;
@property (nonatomic, strong)NSNumber<Optional> *groupId;
@property (nonatomic, copy)NSString<Optional> *id_str;
@property (nonatomic, strong)NSNumber<Optional> *image_status;
@property (nonatomic, assign)BOOL is_anonymous;
@property (nonatomic, strong)NSNumber<Optional> *is_can_share;
@property (nonatomic, strong)NSNumber<Optional> *is_gif;
@property (nonatomic, strong)NSNumber<Optional> *label;

@property (nonatomic, strong)MenuLargeImage<Optional> *large_image;

@property (nonatomic, strong)NSNumber<Optional> *max_screen_width_percent;
@property (nonatomic, strong)NSNumber<Optional> *media_type;

@property (nonatomic, strong)MenuLargeImage<Optional> *middle_image;

@property (nonatomic, strong)NSNumber<Optional> *min_screen_width_percent;
@property (nonatomic, strong)NSNumber<Optional> *online_time;
@property (nonatomic, strong)NSNumber<Optional> *repin_count;
@property (nonatomic, strong)NSNumber<Optional> *share_count;
@property (nonatomic, strong)NSNumber<Optional> *share_type;
@property (nonatomic, copy)NSString<Optional> *share_url;
@property (nonatomic, strong)NSNumber<Optional> *status;
@property (nonatomic, copy)NSString<Optional> *status_desc;
@property (nonatomic, copy)NSString<Optional> *text;
@property (nonatomic, strong)NSNumber<Optional> *type;

@property (nonatomic, strong)MenuUser<Optional> *user;

@property (nonatomic, strong)NSNumber<Optional> *user_bury;
@property (nonatomic, strong)NSNumber<Optional> *user_digg;
@property (nonatomic, strong)NSNumber<Optional> *user_favorite;
@property (nonatomic, strong)NSNumber<Optional> *user_repin;

@end

@interface MenuDislike_reason : JSONModel

@property (nonatomic, strong)NSNumber<Optional> *DislikeId;
@property (nonatomic, copy)NSString<Optional> *title;
@property (nonatomic, strong)NSNumber<Optional> *type;

@end

@interface MenuLargeImage : JSONModel

@property (nonatomic, strong)NSNumber<Optional> *height;
@property (nonatomic, strong)NSNumber<Optional> *r_height;
@property (nonatomic, strong)NSNumber<Optional> *r_width;
@property (nonatomic, copy)NSString<Optional> *uri;
@property (nonatomic, strong)NSArray<Optional,LargeImageUrl> *url_list;
@property (nonatomic, strong)NSNumber<Optional> *width;

@end

@interface LargeImageUrl : JSONModel

@property (nonatomic, copy)NSString<Optional> *url;

@end

@interface MenuUser : JSONModel

@property (nonatomic, copy)NSString<Optional> *avatar_url;
@property (nonatomic, strong)NSNumber<Optional> *followers;
@property (nonatomic, strong)NSNumber<Optional> *followings;
@property (nonatomic, assign)BOOL is_following;
@property (nonatomic, assign)BOOL is_pro_user;
@property (nonatomic, copy)NSString<Optional> *name;
@property (nonatomic, strong)NSNumber<Optional> *ugc_count;
@property (nonatomic, strong)NSNumber<Optional> *user_id;
@property (nonatomic, assign)BOOL user_verified;

@end

@interface MenuGitVideo : JSONModel

@property (nonatomic, strong)MenuLargeImage<Optional> *video360p;
@property (nonatomic, strong)MenuLargeImage<Optional> *video480p;
@property (nonatomic, strong)MenuLargeImage<Optional> *video720p;
@property (nonatomic, copy)NSString<Optional> *cover_image_uri;
@property (nonatomic, strong)NSNumber<Optional> *duration;
@property (nonatomic, copy)NSString<Optional> *mp4_url;
@property (nonatomic, strong)MenuLargeImage<Optional> *origin_video;
@property (nonatomic, strong)NSNumber<Optional> *video_height;
@property (nonatomic, strong)NSNumber<Optional> *video_width;

@end

