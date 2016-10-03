//
//  AKCVWrapper.m
//  AKPanoramaStitch
//
//  Created by Aryan Kashyap on 04/09/2016.
//  Copyright © 2016 Aryan Kashyap. All rights reserved.
//

#import "AKCVWrapper.h"
#import "UIImage+OpenCV.h"
#import "stitching.hpp"
#import "UIImage+Rotate.h"

using namespace cv;

@implementation AKCVWrapper

+ (UIImage*)ak_processImageWithOpenCV: (UIImage*) inputImage
{
    NSArray* imageArray = [NSArray arrayWithObject:inputImage];
    UIImage* result = [[self class] ak_processWithArray:imageArray];
    return result;
}

+ (UIImage *)ak_processWithOpenCVImage1:(UIImage *)inputImage1 image2:(UIImage *)inputImage2
{
    NSArray* imageArray = [NSArray arrayWithObjects:inputImage1,inputImage2,nil];
    UIImage* result = [[self class] ak_processWithArray:imageArray];
    return result;
}


+ (UIImage*) ak_processWithArray:(NSArray*)imageArray{

    if ([imageArray count] == 0){
        NSLog(@"image Array is empty");
        return 0;
    }
    
    vector<Mat> matImages;
    
    for(id image in imageArray){
        if ([image isKindOfClass:[UIImage class]]){
            /*
             All images taken with the iPhone/iPa cameras are LANDSCAPE LEFT orientation. The  UIImage imageOrientation flag is an instruction to the OS to transform the image during display only. When we feed images into openCV, they need to be the actual orientation that we expect them to be for stitching. So we rotate the actual pixel matrix here if required.
             */
            
            UIImage *rotatedImage = [image rotateToImageOrientation];
            Mat matImage = [rotatedImage CVMat3];
            NSLog (@"matImage: %@",image);
            matImages.push_back(matImage);
        }
    }
    
    NSLog (@"stitching...");
    Mat stitchedMat = stitch(matImages);
    UIImage* result =  [UIImage imageWithCVMat:stitchedMat];
    
    return result;
}

@end
