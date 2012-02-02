//
//  OpenDoorsViewController.h
//  VT
//
//  Created by Paul Ledger on 01/02/2012.
//  Copyright 2011 Flexicoder Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface OpenDoorsViewController : UIViewController {
	UIImageView * leftDoor;
	UIImageView * rightDoor;
	UIImageView * backgroundSplash;

    bool isPortrait;
    bool doorsClosed;
}

@property (nonatomic,retain) IBOutlet UIImageView * leftDoor;
@property (nonatomic,retain) IBOutlet UIImageView * rightDoor;
@property (nonatomic,retain) IBOutlet UIImageView * backgroundSplash;

-(void)openDoors;
@end
