//
//  Easing.m
//  EasingTry
//
//  Created by Mike Li on 28/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Easing.h"

@implementation Easing

+(EasingFunction) getElastic{
    EasingFunction ease;
    ease.easeIn = ^double(double t, double b, double c, double d) {
        if (t==0) return b;
        if ((t/=d)==1) return b+c;
        double p=d*.3;
        double a,s;
        
        a=c;
        s=p/4;
        
        return -(a*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )) + b;
    };
    ease.easeOut = ^double(double t, double b, double c, double d) {
        if (t==0) return b;  
        if ((t/=d)==1) return b+c;  
        double p=d*.3;
        double a,s;
        
        a=c;
        s=p/4;
        
		return (a*pow(2,-10*t) * sin( (t*d-s)*(2*M_PI)/p ) + c + b);
    };
    ease.easeInOut = ^double(double t, double b, double c, double d) {
        if (t==0) return b;
        if ((t/=d/2)==2) return b+c;
        double p=d*(.3*1.5);
        double a,s;
        
        a=c;
        s=p/4;
        
		if (t < 1){
            return -.5*(a*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )) + b;
        }
        return a*pow(2,-10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )*.5 + c + b;
    };
    
    return ease;
}

+(EasingFunction)getBounce{
    EasingFunction ease;
    
    const KeyframeParametricBlock bounceOut = ^double(double t, double b, double c, double d) {
        if ((t/=d) < (1/2.75)) {
			return c*(7.5625*t*t) + b;
		} else if (t < (2/2.75)) {
			return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
		} else if (t < (2.5/2.75)) {
			return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
		} else {
			return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
		}
    };
    const KeyframeParametricBlock bounceIn = ^double(double t, double b, double c, double d) {
        return c - bounceOut(d-t, 0, c, d) + b;
    };
    
    const KeyframeParametricBlock bounceInOut = ^double(double t, double b, double c, double d) {
        if (t < d/2) return (c - bounceOut(d-t, 0, c, d) + b) * .5 + b;
		else return bounceOut(t*2-d, 0, c, d) * .5 + c*.5 + b;
    };
    
    ease.easeIn = bounceIn;
    ease.easeOut = bounceOut;
    ease.easeInOut = bounceInOut;
    
    return ease;
}

+(EasingFunction)getBack{
    EasingFunction ease;
    ease.easeIn = ^double(double t, double b, double c, double d) {
        double s = 1.70158;
		return c*(t/=d)*t*((s+1)*t - s) + b;
    };
    ease.easeOut = ^double(double t, double b, double c, double d) {
        double s = 1.70158;
		return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
    };
    ease.easeInOut = ^double(double t, double b, double c, double d) {
        double s = 1.70158; 
		if ((t/=d/2) < 1){
            return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
        }
		return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
    };
    return ease;
}
+(EasingFunction)getLinear{
    EasingFunction ease;
    ease.easeIn = ^double(double t, double b, double c, double d) {
        return c*t/d + b;
    };
    ease.easeOut = ^double(double t, double b, double c, double d) {
        return c*t/d + b;
    };
    ease.easeInOut = ^double(double t, double b, double c, double d) {
		return c*t/d + b;
    };
    return ease;
}
+(EasingFunction)getExpo{
    EasingFunction ease;
    ease.easeIn = ^double(double t, double b, double c, double d) {
        return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b;
    };
    ease.easeOut = ^double(double t, double b, double c, double d) {
        return (t==d) ? b+c : c * (-pow(2, -10 * t/d) + 1) + b;
    };
    ease.easeInOut = ^double(double t, double b, double c, double d) {
        if (t==0) return b;
		if (t==d) return b+c;
		if ((t/=d/2) < 1) return c/2 * pow(2, 10 * (t - 1)) + b;
		return c/2 * (-pow(2, -10 * --t) + 2) + b;
    };
    return ease;
}
+(EasingFunction)getQuad{
    EasingFunction ease;
    ease.easeIn = ^double(double t, double b, double c, double d) {
        return c*(t/=d)*t + b;
    };
    ease.easeOut = ^double(double t, double b, double c, double d) {
        return -c *(t/=d)*(t-2) + b;
    };
    ease.easeInOut = ^double(double t, double b, double c, double d) {
        if ((t/=d/2) < 1){
            return c/2*t*t + b;
        }
		return -c/2 * ((--t)*(t-2) - 1) + b;
    };
    return ease;
}
+(EasingFunction)getCubic{
    EasingFunction ease;
    ease.easeIn = ^double(double t, double b, double c, double d) {
        return c*(t/=d)*t*t + b;
    };
    ease.easeOut = ^double(double t, double b, double c, double d) {
        return c*((t=t/d-1)*t*t + 1) + b;
    };
    ease.easeInOut = ^double(double t, double b, double c, double d) {
        if ((t/=d/2) < 1) return c/2*t*t*t + b;
		return c/2*((t-=2)*t*t + 2) + b;
    };
    return ease;
}

+(EasingFunction)getQuart{
    EasingFunction ease;
    ease.easeIn = ^double(double t, double b, double c, double d) {
        return c*(t/=d)*t*t*t + b;
    };
    ease.easeOut = ^double(double t, double b, double c, double d) {
        return -c * ((t=t/d-1)*t*t*t - 1) + b;
    };
    ease.easeInOut = ^double(double t, double b, double c, double d) {
        if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
		return -c/2 * ((t-=2)*t*t*t - 2) + b;
    };
    return ease;
}

+(EasingFunction)getQuint{
    EasingFunction ease;
    ease.easeIn = ^double(double t, double b, double c, double d) {
        return c*(t/=d)*t*t*t*t + b;
    };
    ease.easeOut = ^double(double t, double b, double c, double d) {
        return c*((t=t/d-1)*t*t*t*t + 1) + b;
    };
    ease.easeInOut = ^double(double t, double b, double c, double d) {
        if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
		return c/2*((t-=2)*t*t*t*t + 2) + b;
    };
    return ease;
}

+(EasingFunction)getSine{
    EasingFunction ease;
    ease.easeIn = ^double(double t, double b, double c, double d) {
        return -c * cos(t/d * (M_PI/2)) + c + b;
    };
    ease.easeOut = ^double(double t, double b, double c, double d) {
        return c * sin(t/d * (M_PI/2)) + b;
    };
    ease.easeInOut = ^double(double t, double b, double c, double d) {
        return -c/2 * (cos(M_PI*t/d) - 1) + b;
    };
    return ease;
}

+(EasingFunction)getCirc{
    EasingFunction ease;
    ease.easeIn = ^double(double t, double b, double c, double d) {
        return -c * (sqrt(1 - (t/=d)*t) - 1) + b;
    };
    ease.easeOut = ^double(double t, double b, double c, double d) {
        return c * sqrt(1 - (t=t/d-1)*t) + b;
    };
    ease.easeInOut = ^double(double t, double b, double c, double d) {
        if ((t/=d/2) < 1){
            return -c/2 * (sqrt(1 - t*t) - 1) + b;   
        }
		return c/2 * (sqrt(1 - (t-=2)*t) + 1) + b;
    };
    return ease;
}

@end
