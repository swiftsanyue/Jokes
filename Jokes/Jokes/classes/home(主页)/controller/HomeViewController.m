//
//  HomeViewController.m
//  Jokes
//
//  Created by qianfeng on 16/11/25.
//  Copyright © 2016年 ZL. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeModel.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)Menu *model;

@property (nonatomic, strong)UITableView *tbView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)createTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tbView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tbView.delegate = self;
    self.tbView.dataSource = self;
    [self.view addSubview:self.tbView];
    
    __weak typeof(self) weakSelf = self;
    [self.tbView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
}

- (void)setSubMenus:(NSArray *)subMenus {
    _subMenus = subMenus;
    
//    for (HomeData *model in subMenus) {
//        NSLog(@"%@",model.url);
//    }
    HomeData *model = [subMenus firstObject];
    [self downloaderHome:model.url];
    
    
}

-(void)downloaderHome:(NSString *)urlSting{
    
    //开始下载
    [ProgressHUD show:@"正在下载" Interaction:NO];
    
    [Downloader downloaderWithURLString:urlSting success:^(NSData *data) {
        NSError *e = nil;
        Menu *model = [[Menu alloc] initWithData:data error:&e];
        if (e) {
            NSLog(@"%@",e);
        }else {
            self.model = model;
        }
        //刷新表格
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tbView reloadData];
            
            [ProgressHUD showSuccess:@"下载成功"];
        });
        
    } fail:^(NSError *error) {
        
        [ProgressHUD showError:@"下载失败"];
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    return cell;
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
