//
//  OpenDoorsViewController.m
//  VT
//
//  Created by Paul Ledger on 01/02/2012.
//  Copyright 2011 Flexicoder Ltd. All rights reserved.
//

#import "OpenDoorsViewController.h"


@implementation OpenDoorsViewController
@synthesize leftDoor;
@synthesize rightDoor;
@synthesize backgroundSplash;

-(void)viewWillAppear:(BOOL)animated {
    //All apps start in portrait mode, with the home button at the bottom, 
    //If the device is being held with the home button in any other location then a
    //willRotate is fired!
    
    isPortrait = YES;
    doorsClosed = YES;

    //We assume we are in portrait mode until told otherwise
    self.leftDoor.image = [UIImage imageNamed:@"DoorLeftiPadPortrait.png"];
    self.rightDoor.image = [UIImage imageNamed:@"DoorRightiPadPortrait.png"];
    self.backgroundSplash.image = [UIImage imageNamed:@"SlideBackgroundiPadPortrait.png"];
    
    
    //Add a delay to the open doors sequence, this allows the OS to determine
    //the correct orientaion and fire the all important willRotate
    [NSTimer scheduledTimerWithTimeInterval: 3.5
                                     target: self
                                   selector: @selector(openDoors)
                                   userInfo: nil
                                    repeats: NO];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    isPortrait = UIDeviceOrientationIsPortrait(toInterfaceOrientation);
    
    if (!isPortrait) {
        
        //If the doors haven't already been opened then change them to the landscape ones
        if (doorsClosed) {
            self.leftDoor.image = [UIImage imageNamed:@"DoorLeftiPadLandscape.png"];
            self.rightDoor.image = [UIImage imageNamed:@"DoorRightiPadLandscape.png"];
        }
        self.backgroundSplash.image = [UIImage imageNamed:@"SlideBackgroundiPadLandscape.png"];
    } else {
        self.backgroundSplash.image = [UIImage imageNamed:@"SlideBackgroundiPadPortrait.png"];
    }
    

}



-(void)openDoors {    

    //Determine how far the doors need to move for them to disappear from view
    float adjust = (CGRectGetWidth(self.view.frame) > CGRectGetHeight(self.view.frame)) ? CGRectGetWidth(self.view.frame) : CGRectGetHeight(self.view.frame);
    
    //Retrieve the original frame and then adjust the X position accordingly
    CGRect leftFrame = self.leftDoor.frame;
	CGRect rightFrame = self.rightDoor.frame;;
    
    leftFrame.origin.x = -adjust;
    rightFrame.origin.x += adjust;
	
    //Old School Animation
    
    //Set up the animation, change the frames and commit it
//	[UIView beginAnimations:@"swipe" context:nil];
//	[UIView setAnimationDuration:1.2];
//	[UIView setAnimationDelay:0.0];
//	[UIView setAnimationDelegate:self];
//    
//    self.leftDoor.frame = leftFrame;
//	self.rightDoor.frame = rightFrame;
//	
//	[UIView commitAnimations];
    
    //Blocks
    
    [UIView animateWithDuration:1.2
     
                     animations:^{ 
                         self.leftDoor.frame = leftFrame;
                         self.rightDoor.frame = rightFrame;
 
                     }
     
     ];
    
    
    doorsClosed = NO;
    
}



- (void)dealloc {
	
	[leftDoor release], leftDoor = nil;
	[rightDoor release], rightDoor = nil;
	[backgroundSplash release], backgroundSplash = nil;
    [super dealloc];
}

@end
