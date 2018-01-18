//
//  ViewController.m
//  ShoppingTestDemo
//
//  Created by 赵龙杰 on 2018/1/18.
//  Copyright © 2018年 longjie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)    UITableView     *shoppingCartTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.shoppingCartTableView];
}


-(UITableView *)shoppingCartTableView{
    if (!_shoppingCartTableView) {
        CGRect   tabRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        _shoppingCartTableView = [[UITableView alloc] initWithFrame:tabRect style:UITableViewStylePlain];
        _shoppingCartTableView.delegate = self;
        _shoppingCartTableView.dataSource = self;
        _shoppingCartTableView.estimatedRowHeight = 0;
        _shoppingCartTableView.tableFooterView = [UIView new];
    }
    return _shoppingCartTableView;
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UITableViewCell new];
}
#pragma mark -- UITableviewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
@end








































