//
//  MMMainViewController.m
//  BeanBagXO
//
//  Created by James Donner on 4/23/13.
//  Copyright (c) 2013 jdsv650. All rights reserved.
//

#import "MMMainViewController.h"
#import "MMRegularViewController.h"

@interface MMMainViewController ()

@end

@implementation MMMainViewController


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MMRegularViewController *rvc;
    rvc = [segue destinationViewController];
    
    if([[segue identifier] isEqual: @"SinglePlayerSegue"])
    {
        rvc.isVersusComp = YES;
    }
    else if([[segue identifier] isEqual:@"TwoPlayerSegue"])
    {
        rvc.isVersusComp = NO;
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
