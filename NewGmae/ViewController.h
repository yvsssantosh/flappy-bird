//
//  ViewController.h
//  NewGmae
//
//  Created by Lion User on 27/09/2014.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


int flight;
int topPosition;
int bottomPosition;



@interface ViewController : UIViewController


{
    IBOutlet UILabel *mylabel;
    IBOutlet UILabel *finish;
    IBOutlet UIButton *start;
    IBOutlet UIImageView *MyImage;
    NSTimer *MyTimer;
    IBOutlet UIImageView *rodTop;
    IBOutlet UIImageView *rodBottom;
    NSTimer *rodMovement;
  
    
    
}
-(IBAction)Start:(id)sender;
-(void)movement;
-(void)rod;
-(void)randomRods;


@end
