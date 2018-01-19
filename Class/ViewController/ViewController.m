//
//  ViewController.m
//  ShoppingTestDemo
//
//  Created by 赵龙杰 on 2018/1/18.
//  Copyright © 2018年 longjie. All rights reserved.
//

#import "ViewController.h"
#import "ShopModel.h"
#import <MJExtension.h>
#import "ShopCartTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray  *_dataSourceArray;
}
@property (nonatomic,strong)    UITableView     *shoppingCartTableView;

@property (nonatomic,strong)    ShopModel        *model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSourceArray = [NSMutableArray array];
    [self.view addSubview:self.shoppingCartTableView];
    [self initMainComplaintModel];
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

- (void)initMainComplaintModel{
    NSDictionary    *dic = @{@"reasonlist":@[@{@"reasonName":@"程序员接单后没有到达现场维修",
                                               @"selectedStatus":@"0"
                                               },
                                             @{@"reasonName":@"程序员服务态度好",
                                               @"selectedStatus":@"0"
                                               },
                                             @{@"reasonName":@"工程师维修质量好",
                                               @"selectedStatus":@"0"
                                               },
                                             @{@"reasonName":@"工程师没有按照约定的时间修好产品",
                                               @"selectedStatus":@"0"
                                               },
                                             @{@"reasonName":@"程序员服务态度好",
                                               @"selectedStatus":@"0"
                                               },
                                             @{@"reasonName":@"工程师维修质量好",
                                               @"selectedStatus":@"0"
                                               },
                                             @{@"reasonName":@"工程师没有按照约定的时间修好产品",
                                               @"selectedStatus":@"0"
                                               }
                                             ]
                             };
    
    self.model = [ShopModel mj_objectWithKeyValues:dic];
    for (ShopGoodsListModel *listModel in self.model.reasonlist) {
        [_dataSourceArray addObject:listModel];
    }
    [self.shoppingCartTableView reloadData];
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataSourceArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"goodsCell";
    ShopGoodsListModel *listModel = _dataSourceArray[indexPath.row];
    ShopCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[ShopCartTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.reasonLabel.text = listModel.reasonName;
    cell.selectedButton.selected = listModel.selectedStatus;
    return cell;
}
#pragma mark -- UITableviewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopGoodsListModel *listModel = self.model.reasonlist[indexPath.row];
    listModel.selectedStatus = !listModel.selectedStatus;
//    [self.shoppingCartTableView reloadData];
    ShopCartTableViewCell *cell  = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectedButton.selected = listModel.selectedStatus;
}
@end








































