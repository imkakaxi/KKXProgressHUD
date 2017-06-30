//
//  KKProgressIndicator.h
//  KKXProgressHUD
//
//  Created by iMacWangLing on 17/6/30.
//  Copyright © 2017年 imkakaxi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

@interface KKProgressIndicator : NSView

@property (nonatomic,readonly) CGFloat currentProgress;

- (void)setBackgroundColor:(NSColor *)value;
- (void)setRingColor:(NSColor *)value backgroundRingColor:(NSColor*)value2;
- (void)setRingThickness:(CGFloat)thick;
- (void)setRingRadius:(CGFloat)radius;

- (void)showProgress:(float)progress;

-(void)sizeToFit;

-(void)clear;

@property (nonatomic, readonly) CGFloat ringRadius;
@property (nonatomic, readonly) CGFloat ringThickness;

@end
