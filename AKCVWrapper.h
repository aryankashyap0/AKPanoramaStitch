//
//  AKCVWrapper.h
//  AKPanoramaStitch
//
//  Created by Aryan Kashyap on 04/09/2016.
//  Copyright © 2016 Aryan Kashyap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AKCVWrapper : NSObject

// Process the Images
+ (UIImage *)ak_processImageWithOpenCV:(UIImage *)inputImage;


// If you are gonna stitch 2 images
+ (UIImage*)ak_processWithOpenCVImage1:(UIImage*)inputImage1 image2:(UIImage*)inputImage2;


// Get Images to stitch from an array
+ (UIImage*)ak_processWithArray:(NSArray*)imageArray;


@end
