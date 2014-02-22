//
//  CAKeyframeAnimation.h
//  EasingTry
//
//  Created by Mike Li on 27/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "Easing.h"

@interface CAKeyframeAnimation(Parametric)

+ (id)animationWithKeyPath:(NSString *)path easeFunction:(KeyframeParametricBlock)block fromValue:(double)fromValue toValue:(double)toValue;

@end
