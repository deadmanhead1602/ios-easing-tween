//
//  CAKeyframeAnimation.m
//  EasingTry
//
//  Created by Mike Li on 27/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CAKeyframeAnimation+Parametric.h"

@implementation CAKeyframeAnimation (Parametric)

+ (id)animationWithKeyPath:(NSString *)path 
              easeFunction:(KeyframeParametricBlock)block 
                 fromValue:(double)fromValue 
                   toValue:(double)toValue{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:path];

    NSUInteger steps = 100;
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:steps];
    double diff = (toValue-fromValue);
    for(NSUInteger i = 0; i < steps; i++) {
        double value = block(i, fromValue, diff, steps);
        [values addObject:[NSNumber numberWithDouble:value]];
    }
    
    animation.calculationMode = kCAAnimationLinear;
    [animation setValues:values];
    return(animation);
}

@end
