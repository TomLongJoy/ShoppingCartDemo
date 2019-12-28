//
//  BrokenLineVC.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2019/2/26.
//  Copyright © 2019年 longjie. All rights reserved.
//

#import "BrokenLineVC.h"
#import "BezierCurveView.h"
#import "ZLJSelectedView.h"

#define SCREEN_W  [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height


@interface BrokenLineVC ()

@property (strong,nonatomic)BezierCurveView *bezierView;
@property (strong,nonatomic)NSMutableArray *x_names;
@property (strong,nonatomic)NSMutableArray *targets;
@end

@implementation BrokenLineVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"折线图";
    //分段控制器
    
    ZLJSelectedView *selectedView = [[ZLJSelectedView alloc] initSelectedViewWithFrame:CGRectMake(0, 100,SCREEN_W , 40) titleArray:@[@"开门记录",@"邀请记录",@"其他记录"]];
    
    [self.view addSubview:selectedView];
    
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    //1.初始化
    _bezierView = [BezierCurveView initWithFrame:CGRectMake(30, 0, SCREEN_W, 280)];
    _bezierView.center = self.view.center;
    [self.view addSubview:_bezierView];
    
    //2.折线图
    [self drawLineChart];
    
    //3.柱状图
//        [self drawBaseChart];
    
    //4.饼状图
//        [self drawPieChart];
    
}
#pragma mark - Life Cycle Methods

#pragma mark - Override Methods

#pragma mark - Intial Methods

#pragma mark - Network Methods

#pragma mark - Target Methods

#pragma mark - Public Methods

#pragma mark - Private Methods
//画折线图
-(void)drawLineChart{
    
    //直线
        [_bezierView drawLineChartViewWithX_Value_Names:self.x_names
                                           TargetValues:self.targets 
                                               LineType:LineType_Straight];
    //曲线
//    [_bezierView drawLineChartViewWithX_Value_Names:self.x_names TargetValues:self.targets LineType:LineType_Curve];
}


//画柱状图
-(void)drawBaseChart{
    [_bezierView drawBarChartViewWithX_Value_Names:self.x_names TargetValues:self.targets];
}


//画饼状图
-(void)drawPieChart{
    [_bezierView drawPieChartViewWithX_Value_Names:self.x_names TargetValues:self.targets];
}
#pragma mark - UITableViewDataSource  
#pragma mark - UITableViewDelegate  

#pragma mark - Lazy Loads

/**
 *  X轴值
 */
-(NSMutableArray *)x_names{
    if (!_x_names) {
        _x_names = [NSMutableArray arrayWithArray:@[@"02-21",@"02-22",
                                                    @"02-23",@"02-24",
                                                    @"02-25",@"02-26",
                                                    @"02-27"]];
    }
    return _x_names;
}
/**
 *  Y轴值
 */
-(NSMutableArray *)targets{
    if (!_targets) {
        _targets = [NSMutableArray arrayWithArray:@[@20,@40,
                                                    @20,@50,
                                                    @30,@90,
                                                    @30]];
    }
    return _targets;
}
#pragma mark - NSCopying  

#pragma mark - NSObject  Methods

@end
