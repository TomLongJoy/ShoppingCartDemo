//
//  FaceTakePhotoVC.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2019/3/30.
//  Copyright © 2019年 longjie. All rights reserved.
//

#import "FaceTakePhotoVC.h"
#import <AVFoundation/AVFoundation.h>
#import "LFCameraResultView.h"
#import "LFCamera.h"
#import <SDAutoLayout.h>
@interface FaceTakePhotoVC ()
//2
@property (strong, nonatomic) LFCamera *lfCamera;
@property (strong, nonatomic) LFCameraResultView *resultView;//结果view

@end

@implementation FaceTakePhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSNumber
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationController.navigationBar.hidden = YES;
    self.navigationItem.title = @"自定义照片拍照";
    
   
    //本界面可以随便怎么设计，我这里只做个粗糙版。核心是LFCamera
    self.lfCamera = [[LFCamera alloc] initWithFrame:self.view.bounds];
    UIImageView *overLayImg = [[UIImageView alloc] initWithFrame:self.view.bounds];
    overLayImg.userInteractionEnabled = YES;
    overLayImg.image = [UIImage imageNamed:@"face_layer_thirty"];
//    CGFloat rectY = (self.view.frame.size.height - self.view.frame.size.width)/2;
//    self.lfCamera.effectiveRect = CGRectMake(0,rectY - 50, self.view.frame.size.width , self.view.frame.size.width);
    [self.lfCamera switchCamera:YES];
    [self.lfCamera addSubview:overLayImg];
    [self.view addSubview:self.lfCamera];
    
    
    UIButton    *takePhoto = [UIButton buttonWithType:UIButtonTypeCustom];
    takePhoto.backgroundColor = UIColor.redColor;
    [takePhoto setImage:[UIImage imageNamed:@"collect_face"] forState:normal];
    [overLayImg addSubview:takePhoto];
    takePhoto.sd_layout
    .centerXEqualToView(overLayImg)
    .bottomSpaceToView(overLayImg, 50)
    .widthIs(100)
    .heightEqualToWidth();
    [takePhoto addTarget:self action:@selector(takePhotoClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"正在采集...";
    titleLabel.font = [UIFont systemFontOfSize:15];
    [overLayImg addSubview:titleLabel];
    titleLabel.sd_layout
    .leftEqualToView(overLayImg)
    .rightEqualToView(overLayImg)
    .heightIs(20)
    .bottomSpaceToView(takePhoto, 5);
    
    UIButton    *changeCamera = [UIButton buttonWithType:UIButtonTypeCustom];
//    changeCamera.selected = YES;
    changeCamera.backgroundColor = UIColor.cyanColor;
    [changeCamera setTitle:@"切换" forState:normal];
    [overLayImg addSubview:changeCamera];
    changeCamera.sd_layout
    .centerYEqualToView(takePhoto)
    .rightSpaceToView(overLayImg, 10)
    .widthIs(50)
    .heightEqualToWidth();
    [changeCamera addTarget:self action:@selector(changeCameraClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton    *cancelCamera = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelCamera.backgroundColor = UIColor.cyanColor;
    [cancelCamera setTitle:@"取消" forState:normal];
    [overLayImg addSubview:cancelCamera];
    cancelCamera.sd_layout
    .centerYEqualToView(takePhoto)
    .leftSpaceToView(overLayImg, 10)
    .widthIs(50)
    .heightEqualToWidth();
    [cancelCamera addTarget:self action:@selector(cancelCameraClick:) forControlEvents:UIControlEventTouchUpInside];
}

//取消
- (void)cancelCameraClick:(UIButton *)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

//切换摄像头
- (void)changeCameraClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    [self.lfCamera switchCamera:!sender.selected];
}
//拍照
- (void)takePhotoClick:(UIButton *)sender{
    __weak typeof(self) weakSelf = self;
    [self.lfCamera takePhoto:^(UIImage *img) {
        
        self.resultView = [[LFCameraResultView alloc] initWithFrame:self.view.bounds];
        self.resultView.imageView.image = img;
        
        self.resultView.rephotographBlock = ^ {
            [weakSelf.lfCamera restart];
            
        };
        self.resultView.usePhotoBlock = ^(UIImage *img){
            
        };
        [self.view addSubview:self.resultView];
    }];
}


@end
