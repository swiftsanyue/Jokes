//
//  JKTabBarController.m
//  Jokes
//
//  Created by qianfeng on 16/11/25.
//  Copyright © 2016年 ZL. All rights reserved.
//

#import "JKTabBarController.h"
#import "HomeModel.h"
#import "HomeViewController.h"

@interface JKTabBarController ()

@end

@implementation JKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [UITabBar appearance].tintColor = [UIColor colorWithRed:107.0f/255.0f green:85.0f/255.0f blue:71.0f/255.0f alpha:1.0];
    
    //创建视图控制器
    [self createViewController];
    
    //获取菜单数据
    [self loadMenuData];
    
    [self downloadMenuData];
    
    
}

//获取菜单数据
- (void)loadMenuData{
    NSString *filePath = [self menuFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        //读文件
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        HomeModel *model = [[HomeModel alloc] initWithData:data error:nil];
        
        //显示
        [self showAllMenuData:model];
    }
    //更新菜单数据
    [self downloadMenuData];
}

//下载菜单数据
- (void)downloadMenuData{
    
    NSString *url = @"http://lf.snssdk.com/neihan/service/tabs/?iid=5920841440&idfa=9365102E-5DB8-4018-BA54-E1FA35464F68&version_code=5.6.0&device_type=iPhone%204S&live_sdk_version=130&os_version=7.0.4&screen_width=640&aid=7&vid=4D688CD9-803E-4E63-8378-4CDE7DBD1E56&device_id=32224345118&os_api=18&app_name=joke_essay&device_platform=iphone&ac=WIFI&openudid=69457c5c20b00b4490485578408f731169cb914a&channel=App%20Store&essence=1";
    
    [Downloader downloaderWithURLString:url success:^(NSData *data) {
        
        //解析
        HomeModel *model = [[HomeModel alloc] initWithData:data error:nil];
        
        NSString *path = [self menuFilePath];
        
        //如果plist文件不存在，显示菜单数据
        if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
            [self showAllMenuData:model];
        }

        
        //存储到本地
        
        [data writeToFile:path atomically:YES];
        
        
    } fail:^(NSError *error) {
        NSLog(@"====%@",error);
    }];
    
}

//本地菜单存储
- (NSString *)menuFilePath{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    return [docPath stringByAppendingPathComponent:@"menu.plist"];
}

//显示菜单数据
- (void)showAllMenuData:(HomeModel *)model{
    
    //设置菜单的数据
    UINavigationController *essenceNavCtrl = [self.viewControllers firstObject];
    HomeViewController *essenceCtrl = [essenceNavCtrl.viewControllers firstObject];
    
    essenceCtrl.subMenus = model.data;
    
}

//创建视图控制器
- (void)createViewController{
    
    NSArray *viewCtrlName= @[@"HomeViewController",
                             @"FoundViewController",
                             @"NewViewController",
                             @"MessageViewController"];
    NSArray *imageName = @[@"home",
                           @"Found",
                           @"tabBar_me_icon",
                           @"newstab"];
    NSArray *selectImageName = @[@"home_press",
                                 @"Found_press",
                                 @"tabBar_me_click_icon",
                                 @"newstab_press"];
    NSArray *titleName = @[@"首页",@"发现",@"新鲜",@"消息"];
    
    for (int i=0;i<viewCtrlName.count;i++) {
        // 创建视图控制器对象
        Class cls = NSClassFromString(viewCtrlName[i]);
        UIViewController *tmpCtrl = [[cls alloc] init];
        
        //设置文字
        tmpCtrl.tabBarItem.title = titleName[i];
        
        //设置图片
        tmpCtrl.tabBarItem.image = [UIImage imageNamed:imageName[i]];
        
        //图片不同，没有选中保持原色
//        tmpCtrl.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        tmpCtrl.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName[i]];
        
        
        //创建导航
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:tmpCtrl];
        
        //添加视图控制器
        [self addChildViewController:navCtrl];
        
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
