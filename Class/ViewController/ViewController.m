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

#import "JsOCViewController.h"
#import "ZLJpureLayoutViewController.h"
#import "SendMessageViewController.h"
#import "WIFIMessageViewController.h"
#import "WebCacheViewController.h"
#import "BrokenLineVC.h"
#import "ZZWViewController.h"
#import "RuntimVC.H"
#import "FaceTakePhotoVC.h"
#import "BaseWebView.h"
#import "FMDBViewController.h"

#import "ZLJFormViewController.h"//FORM
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
    
    self.navigationItem.title = @"navigation";
//    self.tabBarItem.title = @"tabBarItem";
//    self.title = @"title";
//    self.navigationItem.prompt=@"这是什么？";
    _dataSourceArray = [NSMutableArray array];
    [self.view addSubview:self.shoppingCartTableView];
    [self initMainComplaintModel];
    
    printf("char : %d",CHAR_MIN);
}

-(UITableView *)shoppingCartTableView{
    if (!_shoppingCartTableView) {
        CGRect   tabRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        _shoppingCartTableView = [[UITableView alloc] initWithFrame:tabRect style:UITableViewStylePlain];
        _shoppingCartTableView.delegate = self;
        _shoppingCartTableView.dataSource = self;
        _shoppingCartTableView.estimatedRowHeight = 100;
        /**
         *default is NO. Controls whether multiple rows can be selected simultaneously
         *默认是NO，控制是否同时多行可选（大意是：默认NO，是否可以同时多行操作<选中，删除等操作>）
         *
         * allowsMultipleSelection == YES;多选
         * allowsMultipleSelection == NO;单选
         */
        _shoppingCartTableView.allowsMultipleSelection = NO;
        _shoppingCartTableView.tableFooterView = [UIView new];
    }
    return _shoppingCartTableView;
}

- (void)initMainComplaintModel{
    NSDictionary    *dic = @{@"reasonlist":@[@{@"reasonName":@"JsOC互相调用",
                                               @"selectedStatus":@"0",
                                               @"className":@"JsOCViewController"
                                               },
                                             @{@"reasonName":@"PureLayout学习",
                                               @"selectedStatus":@"0",
                                               @"className":@"ZLJpureLayoutViewController"
                                               },
                                             @{@"reasonName":@"发送短信",
                                               @"selectedStatus":@"0",
                                               @"className":@"SendMessageViewController"
                                               },
                                             @{@"reasonName":@"WIFI强度",
                                               @"selectedStatus":@"0",
                                               @"className":@"WIFIMessageViewController"
                                               },
                                             @{@"reasonName":@"WebCache",
                                               @"selectedStatus":@"0",
                                               @"className":@"WebCacheViewController"
                                               },
                                             @{@"reasonName":@"折线图",
                                               @"selectedStatus":@"0",
                                               @"className":@"BrokenLineVC"
                                               },
                                             @{@"reasonName":@"智之屋SDK",
                                               @"selectedStatus":@"0",
                                               @"className":@"ZZWViewController"
                                               },
                                             @{@"reasonName":@"RuntimProperty",
                                               @"selectedStatus":@"0",
                                               @"className":@"RuntimVC"
                                               },
                                             @{@"reasonName":@"人脸拍照",
                                               @"selectedStatus":@"0",
                                               @"className":@"FaceTakePhotoVC"
                                               },
                                             @{@"reasonName":@"webview",
                                               @"selectedStatus":@"0",
                                               @"className":@"BaseWebView"
                                               },
                                             @{@"reasonName":@"FMDB",
                                               @"selectedStatus":@"1",
                                               @"className":@"FMDBViewController"
                                               },
                                             @{@"reasonName":@"FORM -- FMDB",
                                               @"selectedStatus":@"0",
                                               @"className":@"FMDBViewController"
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
    cell.selected = !cell.selected;
    return cell;
}
#pragma mark -- UITableviewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIImage *image = [UIImage imageNamed:@"face_layer_ten"];
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);

    /**
     *模拟--付款按钮点击
     *self.shoppingCartTableView == tableview
     */
    NSArray *indexPathArray = self.shoppingCartTableView.indexPathsForSelectedRows;
    for (NSInteger i=0; i<indexPathArray.count; i++) {
        NSIndexPath *indexPath = indexPathArray[i];
        NSInteger   selectedRow = indexPath.row;
        ShopGoodsListModel  *listModel = self.model.reasonlist[selectedRow];
        NSLog(@"[%ld:%@]",selectedRow,listModel.reasonName);
    }
    ShopGoodsListModel  *listModel = _dataSourceArray[indexPath.row];
    Class ViewControllerClass = NSClassFromString(listModel.className);
    id viewController = [[ViewControllerClass alloc] init];
    NSLog(@"%@",listModel.className);
    [self.navigationController pushViewController:viewController animated:YES];

}

#pragma mark -- <保存到相册>
-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *msg = nil ;
    if(error){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"zlj--当前输出：%s",__FUNCTION__);
}

@end








































