//
//  MMiPadMainViewController.m
//  BeanBagXO
//
//  Created by James Donner on 4/26/13.
//  Copyright (c) 2013 jdsv650. All rights reserved.
//

#import "MMiPadMainViewController.h"
#import "MMRegulariPadViewController.h"

@interface MMiPadMainViewController ()

@end

@implementation MMiPadMainViewController


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
     MMRegulariPadViewController *ivc;
    ivc = [segue destinationViewController];
    
    if([[segue identifier] isEqual: @"SinglePlayerSegue"])
    {
        ivc.isVersusComp = YES;
    }
    else if([[segue identifier] isEqual:@"TwoPlayerSegue"])
    {
        ivc.isVersusComp = NO;
    }
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"beachsand4.png"]];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
