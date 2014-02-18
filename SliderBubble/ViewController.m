//
//  ViewController.m
//  SliderBubble
//
//  Created by Bill Richards on 2/18/14.
//  Copyright (c) 2014 Bill Richards. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIView *bubbleView;
@property (weak, nonatomic) IBOutlet UIView *tipView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.bubbleView.alpha = 0;
    self.tipView.alpha = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self sliderChanged:self.slider];
}

- (IBAction)sliderChanged:(UISlider *)sender
{
    CGFloat viewWidth = CGRectGetWidth(self.slider.frame);
    CGFloat viewMinX = CGRectGetMinX(self.slider.frame);
    CGFloat viewMaxX = CGRectGetMaxX(self.slider.frame);
    CGFloat padding = 6;
    
    CGFloat bubbleWidth = CGRectGetWidth(self.bubbleView.frame);
    CGFloat tipWidth = CGRectGetWidth(self.tipView.frame);
    
    CGRect bubbleFrame = self.bubbleView.frame;
    CGRect tipFrame = self.tipView.frame;
    
    bubbleFrame.origin.x = ((viewWidth * sender.value) + viewMinX) - (bubbleWidth / 2);

    if (bubbleFrame.origin.x <= viewMinX) {
        bubbleFrame.origin.x = viewMinX;
    }
    
    if (bubbleFrame.origin.x >= (viewMaxX-bubbleWidth)) {
        bubbleFrame.origin.x = (viewMaxX-bubbleWidth);
    }
    
    tipFrame.origin.x = ((viewWidth * sender.value) + viewMinX) - (tipWidth / 2);
    
    if (tipFrame.origin.x <= (viewMinX + padding)) {
        tipFrame.origin.x = (viewMinX + padding);
    }
    
    if (tipFrame.origin.x >= ((viewMaxX-padding)-tipWidth)) {
        tipFrame.origin.x = ((viewMaxX-padding)-tipWidth);
    }
    
    self.bubbleView.frame = bubbleFrame;
    self.tipView.frame = tipFrame;
}

- (IBAction)sliderTouchDownAction:(id)sender
{
    [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^
    {
        self.bubbleView.alpha = 1;
        self.tipView.alpha = 1;
        
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)sliderTouchUpAction:(id)sender
{
    [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^
    {
        self.bubbleView.alpha = 0;
        self.tipView.alpha = 0;
    } completion:^(BOOL finished) {
        
    }];
}

@end
