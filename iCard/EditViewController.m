//
//  EditViewController.m
//  iCard
//
//  Created by Y on 15-9-9.
//  Copyright (c) 2015年 huxiu. All rights reserved.
//

#import "EditViewController.h"
#import "User.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加编辑完成事件
    [self.okButton addTarget:self action:@selector(clickedToOk) forControlEvents:UIControlEventTouchUpInside];
    //添加取消编辑事件
    [self.cancelButton addTarget:self action:@selector(clickedToCancel) forControlEvents:UIControlEventTouchUpInside];
    //设置输入框的光标颜色
    self.nameTextField.tintColor =
    self.jobTextField.tintColor =
    self.phoneTextField.tintColor =
    self.emailTextField.tintColor =
    self.addressTextField.tintColor =
    [self.okButton titleColorForState:UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //得到用户信息
    [self inputValue:[User info]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSDictionary *)outputValue {
    return @{
             kName:(self.nameTextField.text?self.nameTextField.text:@""),
             kJob:(self.jobTextField.text?self.jobTextField.text:@""),
             kPhone:(self.phoneTextField.text?self.phoneTextField.text:@""),
             kEmail:(self.emailTextField.text?self.emailTextField.text:@""),
             kAddress:(self.addressTextField.text?self.addressTextField.text:@"")
             };
}

- (void)inputValue:(NSDictionary *)dictionary {
    self.nameTextField.text = dictionary[kName];
    self.jobTextField.text = dictionary[kJob];
    self.phoneTextField.text = dictionary[kPhone];
    self.emailTextField.text = dictionary[kEmail];
    self.addressTextField.text = dictionary[kAddress];
}

- (void)clickedToOk {
    [User setInfo:[self outputValue]];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)clickedToCancel {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
