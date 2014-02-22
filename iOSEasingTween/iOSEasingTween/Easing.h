//
//  Easing.h
//  EasingTry
//
//  Created by Mike Li on 28/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef double (^KeyframeParametricBlock)(double,double,double,double);
typedef struct {
    __unsafe_unretained KeyframeParametricBlock easeIn;
    __unsafe_unretained KeyframeParametricBlock easeOut;
    __unsafe_unretained KeyframeParametricBlock easeInOut;
}EasingFunction;

@interface Easing : NSObject
+(EasingFunction)getElastic;
+(EasingFunction)getBounce;
+(EasingFunction)getBack;
+(EasingFunction)getLinear;
+(EasingFunction)getExpo;
+(EasingFunction)getQuad;
+(EasingFunction)getCubic;
+(EasingFunction)getQuart;
+(EasingFunction)getQuint;
+(EasingFunction)getSine;
+(EasingFunction)getCirc;
@end
