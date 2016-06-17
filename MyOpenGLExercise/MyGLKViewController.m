//
//  MyGLKViewController.m
//  MyOpenGLExercise
//
//  Created by Priya Thiagarajan on 15/06/16.
//  Copyright © 2016 Priya Thiagarajan. All rights reserved.
//

#import "MyGLKViewController.h"
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>

@interface MyGLKViewController ()


@end

@implementation MyGLKViewController {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setEAGLContext];

    // Configure renderbuffers created by the view
    glView.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;
    glView.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    glView.drawableStencilFormat = GLKViewDrawableStencilFormat8;
    // Enable multisampling
    glView.drawableMultisample = GLKViewDrawableMultisample4X;
    
    [self setRenderBuffer];
    
    [self setFrameBuffer];
    
    [self setGLViewColor];
    
    [self.view setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:glView];
}

- (void)setEAGLContext {
    _eaglLayer = (CAEAGLLayer*) self.view.layer;
    _eaglLayer.opaque = YES;
    
    GLKView *view = [[GLKView alloc] initWithFrame:CGRectMake(0, 0, 600, 600)];
    _context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    [EAGLContext setCurrentContext:_context];
    view.context = _context;

}

- (void)setRenderBuffer {
    glGenRenderbuffers(1, &_colorRenderBuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);
    [_context renderbufferStorage:GL_RENDERBUFFER fromDrawable:(CAEAGLLayer*) glView.layer];
}

- (void)setFrameBuffer {
    GLuint framebuffer;
    glGenFramebuffers(1, &framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0,
                              GL_RENDERBUFFER, _colorRenderBuffer);

}

- (void) setGLViewColor {
    glClearColor(1, 104.0/255.0, 55.0/255.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    [_context presentRenderbuffer:GL_RENDERBUFFER];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
