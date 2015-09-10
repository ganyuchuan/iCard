//
//  User.m
//  iCard
//
//  Created by Y on 15-9-10.
//  Copyright (c) 2015年 huxiu. All rights reserved.
//

#import "User.h"

const NSString *QRCodeFileName = @"qrcode.png";

static UIImage *ORCodeImage = nil;

@implementation User

+ (NSDictionary *)info {
    return [[NSUserDefaults standardUserDefaults] valueForKey:kUserInfo];
}

+ (void)setInfo:(NSDictionary *)Info {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSUserDefaults standardUserDefaults] setValue:Info forKey:kUserInfo];
        [[NSUserDefaults standardUserDefaults] synchronize];
    });
}

+ (UIImage *)qrcodeImage {
    if (ORCodeImage == nil) {
        NSData *data = [NSData dataWithContentsOfFile:[self qrcodePath]];
        ORCodeImage = [UIImage imageWithData:data];
    }
    
    return ORCodeImage;
}

+ (void)setQRCodeImage:(UIImage *)image {
    ORCodeImage = image;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        image?
        [UIImagePNGRepresentation(image) writeToFile:[self qrcodePath] atomically:YES]:
        [[NSFileManager defaultManager] removeItemAtPath:[self qrcodePath] error:nil];
    });
}

+ (NSString *)qrcodePath {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    return [NSString stringWithFormat:@"%@/%@", path, QRCodeFileName];
}

@end
