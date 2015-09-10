//
//  ViewController.h
//  iCard
//
//  Created by Y on 15-9-6.
//  Copyright (c) 2015年 huxiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLAnimatedImageView.h"

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet FLAnimatedImageView *animatedImageView;

@end

