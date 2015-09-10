//
//  QRCodeViewController.h
//  iCard
//
//  Created by Y on 15-9-9.
//  Copyright (c) 2015年 huxiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QRCodeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;
@property (weak, nonatomic) IBOutlet UIImageView *qrcodeImageView;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end
