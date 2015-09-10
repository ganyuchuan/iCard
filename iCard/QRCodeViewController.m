//
//  QRCodeViewController.m
//  iCard
//
//  Created by Y on 15-9-9.
//  Copyright (c) 2015年 huxiu. All rights reserved.
//

#import "QRCodeViewController.h"
#import "User.h"
#import "Helper.h"

@interface QRCodeViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    UIImagePickerController *imagePicker;
}

@end

@implementation QRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回到主界面
    [self.backButton addTarget:self action:@selector(clickedToBack) forControlEvents:UIControlEventTouchUpInside];
    //照片选择器
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    if ([Helper checkPhotoLibraryAuthorizationStatus]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    //点击图片从手机相册中选取二维码
    [self.qrcodeImageView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(tapedToPickQRCode:)]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //获取用户二维码图片信息
    [self inputValue:[User qrcodeImage]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIImage *)outputValue {
    return self.qrcodeImageView.image;
}

- (void)inputValue:(UIImage *)image {
    self.promptLabel.hidden = image ? YES : NO;
    self.qrcodeImageView.image = image;
}

- (void)clickedToBack {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)tapedToPickQRCode:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self presentViewController:imagePicker animated:YES completion:NULL];
    }
}

#pragma mark - image picker controller delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //得到编辑后的图片
    UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    [self inputValue:editedImage];
    //保存
    [User setQRCodeImage:editedImage];
    //退出
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
