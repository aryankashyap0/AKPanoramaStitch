//
//  UIImage+Rotate.h
//  AKPanoramaStitch
//
//  Created by Aryan Kashyap on 04/09/2016.
//  Copyright © 2016 Aryan Kashyap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Rotate)

// Alters the exif flag but doesnt change the pixel data
- (UIImage *)rotateExifToOrientation:(UIImageOrientation)orientation;

// slower, rotates the actual pixel matrix
- (UIImage *)rotateBitmapToOrientation:(UIImageOrientation)orientation;

- (UIImage *)rotateToImageOrientation;

@end
