//
//  ZLJSelectedView.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2019/5/30.
//  Copyright © 2019年 longjie. All rights reserved.
//

#import "ZLJSelectedView.h"

@interface ZLJSelectedView ()
{
    UILabel     *_selectedLabel;//选中时候底部线
}
@end

@implementation ZLJSelectedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype )initSelectedViewWithFrame:(CGRect )viewFrame titleArray:(NSArray <NSString *>*)titleArray{
    self = [super initWithFrame:viewFrame];
    if (self) {
        _selectedLabel = [[UILabel alloc] init];
        _selectedLabel.backgroundColor = UIColor.redColor;
        CGFloat selfWidth = viewFrame.size.width;
        CGFloat selfHeight = viewFrame.size.height;
        
        CGFloat buttonHeight = selfHeight - 2;
        CGFloat buttonWidth = selfWidth / titleArray.count;
        
        for (int i = 0; i < titleArray.count; i++) {
            CGFloat buttonX = buttonWidth * i; 
            UIButton    *subButton = [UIButton buttonWithType:UIButtonTypeCustom];
            subButton.tag = i;
            [subButton setTitle:titleArray[i] forState:UIControlStateNormal];
            subButton.frame = CGRectMake(buttonX, 0, buttonWidth, buttonHeight);
            [subButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
            [subButton.titleLabel setAdjustsFontSizeToFitWidth:YES];
            [subButton setTitleColor:UIColor.redColor forState:UIControlStateSelected];

            [self addSubview:subButton];
            if (i  == 0) {
                NSLog(@"+++++=%f",subButton.titleLabel.bounds.size.width);

                _selectedLabel.frame = CGRectMake(buttonWidth / 4.0, buttonHeight, buttonWidth / 2.0, 2);
            }
            [subButton addTarget:self action:@selector(subButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        UILabel *bottomLineView = [[UILabel alloc] init];
        bottomLineView.backgroundColor = UIColor.groupTableViewBackgroundColor;
        bottomLineView.frame = CGRectMake(0, selfHeight - 1, selfWidth, 1);
        [self addSubview:bottomLineView];
        [self addSubview:_selectedLabel];

    }
    return self;
}

- (void)subButtonClick:(UIButton *)sender{
    NSArray *array = [self subviews];//获取button父视图上的所有子控件
    for(int i=0;i<array.count;i++) //遍历数组 找出所有的button
    {
        id view = array[i];
        if([view isKindOfClass:[UIButton class]])
        {
            UIButton *btn = (UIButton*)view;
            [btn setBackgroundColor:[UIColor whiteColor]];//未选中button的颜色
            btn.selected = NO;
        }
    }
    sender.selected =YES;
    CGFloat labelX = sender.frame.origin.x + sender.frame.size.width / 4.0 ;
    CGFloat labelY = _selectedLabel.frame.origin.y;
    CGFloat labelWidth = sender.frame.size.width / 2.0;
   
    [UIView animateWithDuration:0.3 animations:^{
       
        _selectedLabel.frame = CGRectMake(labelX,labelY ,labelWidth , 2);
    }];
}

@end
