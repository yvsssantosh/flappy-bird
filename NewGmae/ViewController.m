//
//  ViewController.m
//  NewGmae
//
//  Created by Lion User on 27/09/2014.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    rodTop.hidden=YES;
    rodBottom.hidden=YES;
    finish.hidden=YES;
	
}
-(IBAction)Start:(id)sender
{
    start.hidden=YES;
    mylabel.hidden=YES;
    rodTop.hidden=NO;
    rodBottom.hidden=NO;
    finish.hidden=YES;
   MyTimer =[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(movement) userInfo:nil repeats:YES];
    [self rod];
    
    rodMovement=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(randomRods) userInfo:nil repeats:YES];
    
    
}

-(void)randomRods
{
    
    rodTop.center=CGPointMake(rodTop.center.x -1,rodTop.center.y );
    rodBottom.center=CGPointMake(rodBottom.center.x -1, rodBottom.center.y);
    
    if(rodTop.center.x <-28)
    {
        [self rod];
    }
   
    if(CGRectIntersectsRect(MyImage.frame, rodTop.frame))
    {
       
        finish.hidden=NO;
        
        [rodMovement invalidate];
        [MyTimer invalidate];
        start.hidden=NO;}
    if(CGRectIntersectsRect(MyImage.frame, rodBottom.frame))
    {
        
        finish.hidden=NO;
        
        [rodMovement invalidate];
        [MyTimer invalidate]; 
        start.hidden=NO;}
    
}
-(void)rod
{
    
    topPosition =arc4random()%350;
    topPosition=topPosition - 228;
    bottomPosition=topPosition+655;
    rodTop.center=CGPointMake(340, topPosition);
    rodBottom.center=CGPointMake(340, bottomPosition);
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    flight =30;
    
}

-(void)movement
{
    
    MyImage.center=CGPointMake(MyImage.center.x , MyImage.center.y - flight);
    
    flight=flight - 5;
    
    if(flight < -15)
    {
        flight = -15;
    }
    if(flight>0)
    {
        MyImage.image=[UIImage imageNamed:@"Bird Up.png"];
        
    }
    if(flight<0)
    {
        MyImage.image=[UIImage imageNamed:@"Bird Down.png"];
    }
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
