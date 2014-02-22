//
//  ViewController.h
//  iOSEasingTween
//
//  Created by Mike Li on 22/2/14.
//  Copyright (c) 2014 dcp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAKeyframeAnimation+Parametric.h"

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIView *translateObj;
    UIView *scaleObj;
    UIView *rotateObj;
    float duration;
    
    UIPickerView *pickerView;
    
    NSMutableArray *easingList;
    EasingFunction currentEasing;
}

-(void)easeIn:(UIButton*)btn;
-(void)easeOut:(UIButton*)btn;
-(void)easeInOut:(UIButton*)btn;

-(void)doAnimation:(KeyframeParametricBlock)easingFn;
-(EasingFunction)getEaseFn:(NSString*)easeType;

@end
