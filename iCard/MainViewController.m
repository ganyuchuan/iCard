//
//  ViewController.m
//  iCard
//
//  Created by Y on 15-9-6.
//  Copyright (c) 2015年 huxiu. All rights reserved.
//

#import "MainViewController.h"
#import "User.h"
#import "FLAnimatedImage.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //动态背景播放
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"img_bg" withExtension:@"gif"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:data];
    self.animatedImageView.animatedImage = image;
    //检查用户信息并初始化
    if ([User info] == nil) {
        [User setInfo:[self outputValue]];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //获取用户信息
    [self inputValue:[User info]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSDictionary *)outputValue {
    return @{
             kName:(self.nameLabel.text?self.nameLabel.text:@""),
             kJob:(self.jobLabel.text?self.jobLabel.text:@""),
             kPhone:(self.phoneLabel.text?self.phoneLabel.text:@""),
             kEmail:(self.emailLabel.text?self.emailLabel.text:@""),
             kAddress:(self.addressLabel.text?self.addressLabel.text:@"")
             };
}

- (void)inputValue:(NSDictionary *)dictionary {
    self.nameLabel.text = dictionary[kName];
    self.jobLabel.text = dictionary[kJob];
    self.phoneLabel.text = dictionary[kPhone];
    self.emailLabel.text = dictionary[kEmail];
    self.addressLabel.text = dictionary[kAddress];
}

@end
