//
//  User.h
//  iCard
//
//  Created by Y on 15-9-10.
//  Copyright (c) 2015年 huxiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kUserInfo   @"iCard"
#define kName       @"name"
#define kJob        @"job"
#define kPhone      @"phone"
#define kEmail      @"email"
#define kAddress    @"address"

@interface User : NSObject

+ (NSDictionary *)info;
+ (void)setInfo:(NSDictionary *)info;
+ (UIImage *)qrcodeImage;
+ (void)setQRCodeImage:(UIImage *)image;

@end
