//
//  EditViewController.h
//  iCard
//
//  Created by Y on 15-9-9.
//  Copyright (c) 2015年 huxiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *okButton;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *jobTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;

@end
