//
//  JKTableViewController.m
//  Jokes
//
//  Created by qianfeng on 16/11/29.
//  Copyright © 2016年 ZL. All rights reserved.
//

#import "JKTableViewController.h"
#import "HomeModel.h"

@interface JKTableViewController ()

//表格
@property (nonatomic, strong)UITableView *tbView;

//数据
@property (nonatomic, strong)Menu *model;


@end

@implementation JKTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
}
//创建表格
- (void)createTableView{
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.tbView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//    self.tbView.delegate = self;
//    self.tbView.dataSource = self;
//    [self.view addSubview:_tbView];
    
    //约束
//    __weak typeof (self) weakSelf=self;
//    [self.tbView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(weakSelf.view);
//    }];
}

//下载数据列表
- (void)downloaderListData{
    
    //开始下载
    [ProgressHUD show:@"正在下载" Interaction:NO];
    
//    NSString *urlStr = self.url;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
