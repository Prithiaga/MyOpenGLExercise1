//
//  MyGLKViewController.h
//  MyOpenGLExercise
//
//  Created by Priya Thiagarajan on 15/06/16.
//  Copyright © 2016 Priya Thiagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>

@interface MyGLKViewController : UIViewController {
    CAEAGLLayer* _eaglLayer;
    EAGLContext* _context;
    GLuint _colorRenderBuffer;
    GLKView *glView;
}
@end

