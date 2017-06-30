//
//  AppDelegate.m
//  KKXProgressHUD
//
//  Created by iMacWangLing on 17/6/30.
//  Copyright © 2017年 imkakaxi. All rights reserved.
//

#import "AppDelegate.h"
#import "KKProgressHUD.h"
#import "KKProgressIndicator.h"
#import "KKProgressHUD.h"
#import "KKActivityIndicator.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSView *testView;

@property (weak) IBOutlet NSWindow *window;

@property (weak) IBOutlet KKProgressIndicator *progressHUD;

@property (weak) IBOutlet KKActivityIndicator *activityIndicator;


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.testView.wantsLayer = YES;
    self.testView.layer.backgroundColor = [NSColor blueColor].CGColor;
    self.testView.layer.masksToBounds = YES;
}
- (IBAction)testBtn:(id)sender {
    NSLog(@"我还能响应");
}

- (IBAction)click:(id)sender {
    
    [KKProgressHUD showStatus:@"菊花啊菊花" FromView:self.testView];
}
- (IBAction)secondClick:(id)sender {
    [KKProgressHUD dismiss];
}

NSTimer* timer;

- (IBAction)popProgerssHud:(id)sender {
    [KKProgressHUD showProgress:0 withStatus:@"The Progress!" FromView:self.testView];
    
    [timer invalidate];
    timer = nil;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(continueProgress) userInfo:nil repeats:YES];
}

- (void)continueProgress
{
    static float prog = 0;
    
    
    prog += 0.334;
    
    if(prog > 1.1) {
        [KKProgressHUD dismiss];
        prog = 0;
        [timer invalidate];
        timer = nil;
    }
    else {
        [KKProgressHUD showProgress:prog withStatus:@"The Progress!" FromView:self.testView];
    }
    
}


- (IBAction)stopProgressHUD:(id)sender {
    [KKProgressHUD dismiss];
    [timer invalidate];
    timer = nil;
}

- (IBAction)ChangeProgess:(id)sender {
    static CGFloat newProgress = 0;
    newProgress = (self.progressHUD.currentProgress+0.25) > 1 ? 0 : self.progressHUD.currentProgress+0.25;
    
    [self.progressHUD showProgress:newProgress];

}

- (IBAction)showColor:(id)sender {
    static bool toggle = true;
    
    if(toggle) {
        [self.progressHUD setBackgroundColor:[NSColor lightGrayColor]];
        [self.progressHUD setRingColor:[NSColor orangeColor] backgroundRingColor:[NSColor blueColor]];
    }
    else {
        [self.progressHUD setBackgroundColor:[NSColor clearColor]];
        [self.progressHUD setRingColor:[NSColor whiteColor] backgroundRingColor:[NSColor darkGrayColor]];
    }
    toggle = !toggle;
}

- (IBAction)growRadius:(id)sender {
    [self.progressHUD setRingRadius:self.progressHUD.ringRadius+5];

}

- (IBAction)shrinkRadius:(id)sender {
    [self.progressHUD setRingRadius:self.progressHUD.ringRadius-5];

}

- (IBAction)growThickness:(id)sender {
    [self.progressHUD setRingThickness:self.progressHUD.ringThickness+5];

}
- (IBAction)shrinkThickness:(id)sender {
    [self.progressHUD setRingThickness:self.progressHUD.ringThickness-5];

}

- (IBAction)startActivity:(id)sender {
    [self.activityIndicator startAnimation:nil];
}

- (IBAction)stopActivity:(id)sender {
    [self.activityIndicator stopAnimation:nil];
}

- (IBAction)changeAvtivityColor:(id)sender {
    static bool toggle = true;
    
    if(toggle) {
        [self.activityIndicator setBackgroundColor:[NSColor lightGrayColor]];
        [self.activityIndicator setColor:[NSColor blueColor]];
    }
    else {
        [self.activityIndicator setBackgroundColor:[NSColor clearColor]];
        [self.activityIndicator setColor:[NSColor blackColor]];
    }
    toggle = !toggle;

}




@end
