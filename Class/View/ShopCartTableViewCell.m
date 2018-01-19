//
//  ShopCartTableViewCell.m
//  ShoppingTestDemo
//
//  Created by 赵龙杰 on 2018/1/19.
//  Copyright © 2018年 longjie. All rights reserved.
//

#import "ShopCartTableViewCell.h"

@implementation ShopCartTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self complaintTableViewCellSubview];
    }
    return self;
}

- (void)complaintTableViewCellSubview{
    
    self.reasonLabel = [UILabel new];
    self.reasonLabel.textColor = [UIColor blackColor];
    self.reasonLabel.font  = [UIFont systemFontOfSize:15];
    [self addSubview:self.reasonLabel];
    self.reasonLabel.frame = CGRectMake(15, 0, self.frame.size.width - 30, self.frame.size.height);
    
    self.selectedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectedButton setImage:[UIImage imageNamed:@"check_delect.png"] forState:UIControlStateNormal];
    [self.selectedButton setImage:[UIImage imageNamed:@"check_normal.png"] forState:UIControlStateSelected];
    [self addSubview:self.selectedButton];
    self.selectedButton.frame = CGRectMake(self.bounds.size.width -15, (self.frame.size.height - 15)/2, 15, 15);
        
}

@end
