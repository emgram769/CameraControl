//
//  ViewController.h
//  CameraControl
//
//  Created by Bram Wasti on 6/18/13.
//  Copyright (c) 2013 bwasti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) GPUImageVideoCamera *videoCamera;
@property (nonatomic, strong) GPUImageMotionDetector *motionDetector;
@property(nonatomic, copy) void(^motionDetectionBlock)(CGPoint motionCentroid, CGFloat motionIntensity, CMTime frameTime);

@end
