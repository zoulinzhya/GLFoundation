//
//  UIImage+Extend.m
//  GtOilStorage
//
//  Created by tiangui on 7/25/16.
//  Copyright © 2016 zoulin. All rights reserved.
//

#import "UIImage+Extend.h"

@implementation UIImage (Extend_Color)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *) imageWithOriginImage:(UIImage*)image scale:(CGFloat)scale {
    CGSize size = image.size;
    CGSize newS = CGSizeMake(size.width / scale, size.height / scale);
    UIGraphicsBeginImageContext(newS);
    [image drawInRect:CGRectMake(0, 0, newS.width, newS.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

+ (UIImage *)originalImageWithName:(NSString *)imageName
{
    UIImage *originalImage = [UIImage imageNamed:imageName];
    originalImage = [originalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return originalImage;
}

+ (UIImage *)originImage:(UIImage *)image scaleToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
