//
//  ViewController.m
//  CoreMLDemo
//
//  Created by chenyi on 08/06/2017.
//  Copyright © 2017 chenyi. All rights reserved.
//

#import "ViewController.h"
#import "squeezeNet.h"
#import "UIImage+Utils.h"

@interface ViewController ()

@end

@implementation ViewController

- (NSString *)predictImageScene:(UIImage *)image {
    
    
    UIImage *scaledImage = [image scaleToSize:CGSizeMake(259, 259)]; //259
    UIImage *cropImage = [scaledImage cropToSize:CGSizeMake(227, 227)] ;
    CVPixelBufferRef imageRef = [image pixelBufferFromCGImage:cropImage ];
    
    squeezeNet *Model = [[squeezeNet alloc] init];
    NSError *error = nil;
    NSTimeInterval startime = [[NSDate date] timeIntervalSince1970];
    squeezeNetOutput *output = [Model predictionFromData:imageRef
                                                          error:&error];
    NSTimeInterval endtime = [[NSDate date] timeIntervalSince1970];
    NSLog(@"elapsed time %f", (endtime-startime)*1000);
    if (error != nil) {
        
        NSLog(@"Error is %@", error.localizedDescription);
    }
    NSDictionary* dict = output.prob ;
    NSArray *array = [dict allKeys] ;
    NSString *label = output.classLabel ;
    for (int i = 0; i < array.count; i++) {
        NSString *key = array[i];
        
        NSString *value = dict[key];
        
        if(key == label)
            NSLog(@"max prob: %@", value);
        
        
    }
    
    
    return label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    NSString *astring = @"ILSVRC2012_val_00000779.JPEG";//;
    UIImage* image = [UIImage imageNamed:astring];
    NSString *sceneLabel = [self predictImageScene:image];
    NSLog(@"Scene label is: %@", sceneLabel);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
