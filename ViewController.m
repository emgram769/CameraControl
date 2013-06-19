//
//  ViewController.m
//  CameraControl
//
//  Created by Bram Wasti on 6/18/13.
//  Copyright (c) 2013 bwasti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize motionDetector;
@synthesize videoCamera;
@synthesize motionDetectionBlock;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset640x480 cameraPosition:AVCaptureDevicePositionFront];
    videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    //videoCamera.horizontallyMirrorFrontFacingCamera = NO;
    //videoCamera.horizontallyMirrorRearFacingCamera = NO;
    motionDetector = [[GPUImageMotionDetector alloc]init];
    GPUImageView *filterView = [[GPUImageView alloc]initWithFrame:CGRectMake(0., 0.,480., 640.)];
    [self.view addSubview:filterView];
    [videoCamera addTarget:motionDetector];
    motionDetectionBlock = ^(CGPoint motionCentroid, CGFloat motionIntensity, CMTime frameTime){
    };
    [motionDetector setMotionDetectionBlock:motionDetectionBlock];
    [motionDetector addTarget:filterView];

    [videoCamera startCameraCapture];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
