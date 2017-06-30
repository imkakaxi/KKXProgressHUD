//
//  KKProgressIndicator.h
//  KKXProgressHUD
//
//  Created by iMacWangLing on 17/6/30.
//  Copyright © 2017年 imkakaxi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KKActivityIndicator : NSView

@property BOOL isAnimating;

- (void)setColor:(NSColor *)value;
- (void)setBackgroundColor:(NSColor *)value;

- (void)stopAnimation:(id)sender;
- (void)startAnimation:(id)sender;
 
@end
