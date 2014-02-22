//
//  ViewController.m
//  iOSEasingTween
//
//  Created by Mike Li on 22/2/14.
//  Copyright (c) 2014 dcp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    duration = 1.5;
    
    NSArray *name = [NSArray arrayWithObjects:@"Elastic", @"Bounce",@"Back",@"Linear",@"Expo",@"Quad",@"Cubic",@"Quart",@"Quint",@"Sine",@"Circ", nil];
    
    easingList = [NSMutableArray new];
    for (int i=0; i<name.count; i++) {
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        [dictionary setObject:[name objectAtIndex:i] forKey:@"name"];
        
        [easingList addObject:dictionary];
    }
    
    currentEasing = [Easing getElastic];
    
    // Initialization code
    UIButton *easeInBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    easeInBtn.frame = CGRectMake(20, 20, 85, 30);
    [easeInBtn setTitle:@"Ease In" forState:UIControlStateNormal];
    [easeInBtn addTarget:self action:@selector(easeIn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:easeInBtn];
    
    UIButton *easeOutBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    easeOutBtn.frame = CGRectMake(120, 20, 85, 30);
    [easeOutBtn setTitle:@"Ease Out" forState:UIControlStateNormal];
    [easeOutBtn addTarget:self action:@selector(easeOut:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:easeOutBtn];
    
    UIButton *easeInOutBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    easeInOutBtn.frame = CGRectMake(220, 20, 85, 30);
    [easeInOutBtn setTitle:@"Ease InOut" forState:UIControlStateNormal];
    [easeInOutBtn addTarget:self action:@selector(easeInOut:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:easeInOutBtn];
    
    
    scaleObj = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    scaleObj.center = CGPointMake(self.view.bounds.size.width/2, 100);
    scaleObj.backgroundColor = [UIColor redColor];
    [self.view addSubview:scaleObj];
    
    rotateObj = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    rotateObj.center = CGPointMake(self.view.bounds.size.width/2, 200);
    rotateObj.backgroundColor = [UIColor greenColor];
    [self.view addSubview:rotateObj];
    
    translateObj = [[UIView alloc] initWithFrame:CGRectMake(0, 240, 50, 50)];
    translateObj.backgroundColor = [UIColor blueColor];
    [self.view addSubview:translateObj];
    
    pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 330, 320, 150)];
    pickerView.frame = CGRectMake(0, self.view.bounds.size.height-pickerView.frame.size.height, pickerView.frame.size.width, pickerView.frame.size.height);
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    [self.view addSubview:pickerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)easeIn:(UIButton*)btn{
    //NSLog(@"easeIn");
    [self doAnimation:currentEasing.easeIn];
}

-(void)easeOut:(UIButton*)btn{
    //NSLog(@"easeOut");
    [self doAnimation:currentEasing.easeOut];
}

-(void)easeInOut:(UIButton*)btn{
    //NSLog(@"easeInOut");
    [self doAnimation:currentEasing.easeInOut];
}

-(void)doAnimation:(KeyframeParametricBlock)easingFn{
    [translateObj.layer removeAllAnimations];
    [scaleObj.layer removeAllAnimations];
    [rotateObj.layer removeAllAnimations];
    
    CAKeyframeAnimation *transAnimi = [CAKeyframeAnimation animationWithKeyPath:@"position.x" easeFunction:easingFn fromValue:25.0 toValue:295.0];
    transAnimi.duration = duration;
    transAnimi.removedOnCompletion = YES;
    [translateObj.layer addAnimation:transAnimi forKey:@"translation"];
    
    CAKeyframeAnimation *scaleW = [CAKeyframeAnimation animationWithKeyPath:@"bounds.size.width" easeFunction:easingFn fromValue:50.0 toValue:80.0];
    CAKeyframeAnimation *scaleH = [CAKeyframeAnimation animationWithKeyPath:@"bounds.size.height" easeFunction:easingFn fromValue:50.0 toValue:80.0];
    CAAnimationGroup *scaleGp = [CAAnimationGroup animation];
    scaleGp.animations = [NSArray arrayWithObjects:scaleW, scaleH, nil];
    scaleGp.duration = duration;
    scaleGp.removedOnCompletion = YES;
    [scaleObj.layer addAnimation:scaleGp forKey:@"scale"];
    
    CAKeyframeAnimation *rotateAnimi = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z" easeFunction:easingFn fromValue:0 toValue:M_PI*2];
    rotateAnimi.duration = duration;
    rotateAnimi.removedOnCompletion = YES;
    [rotateObj.layer addAnimation:rotateAnimi forKey:@"rotation"];
    
}
-(EasingFunction)getEaseFn:(NSString*)easeType{
    if ([easeType isEqualToString:@"Elastic"]) {
        return [Easing getElastic];
    }else if ([easeType isEqualToString:@"Bounce"]) {
        return [Easing getBounce];
    }else if ([easeType isEqualToString:@"Back"]) {
        return [Easing getBack];
    }else if ([easeType isEqualToString:@"Linear"]) {
        return [Easing getLinear];
    }else if ([easeType isEqualToString:@"Expo"]) {
        return [Easing getExpo];
    }else if ([easeType isEqualToString:@"Quad"]) {
        return [Easing getQuad];
    }else if ([easeType isEqualToString:@"Cubic"]) {
        return [Easing getCubic];
    }else if ([easeType isEqualToString:@"Quart"]) {
        return [Easing getQuart];
    }else if ([easeType isEqualToString:@"Quint"]) {
        return [Easing getQuint];
    }else if ([easeType isEqualToString:@"Sine"]) {
        return [Easing getSine];
    }else if ([easeType isEqualToString:@"Circ"]) {
        return [Easing getCirc];
    }
    
    return [Easing getLinear];
}

#pragma - mark picker delegate and data source
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    currentEasing = [self getEaseFn: (NSString*)[[easingList objectAtIndex:row] objectForKey:@"name"]];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
	return [[easingList objectAtIndex:row] objectForKey:@"name"];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return easingList.count;
}

@end
