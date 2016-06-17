//
//  AppDelegate.h
//  MyOpenGLExercise
//
//  Created by Priya Thiagarajan on 15/06/16.
//  Copyright © 2016 Priya Thiagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyGLKViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet MyGLKViewController *glView;
@property (strong, nonatomic) UIWindow *window;


@end

