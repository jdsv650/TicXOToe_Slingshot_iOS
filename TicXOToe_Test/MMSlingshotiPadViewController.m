//
//  MMSlingshotiPadViewController.m
//  BeanBagXO
//
//  Created by James Donner on 4/27/13.
//  Copyright (c) 2013 jdsv650. All rights reserved.
//

#import "MMSlingshotiPadViewController.h"

char tictac[3][3];
int row,col;

@interface MMSlingshotiPadViewController()
{
  
    __weak IBOutlet UIButton *button1_1_Out;
    __weak IBOutlet UIButton *button1_2_Out;
    __weak IBOutlet UIButton *button1_3_Out;
    __weak IBOutlet UIButton *button2_1_Out;
    __weak IBOutlet UIButton *button2_2_Out;
    __weak IBOutlet UIButton *button2_3_Out;
    __weak IBOutlet UIButton *button3_1_Out;
    __weak IBOutlet UIButton *button3_2_Out;
    __weak IBOutlet UIButton *button3_3_Out;
    __weak IBOutlet UIImageView *beanBagOutlet;
    __weak IBOutlet UIImageView *slingshotOutlet;
    int beginY, endY;
    int beginX, endX;
    UITouch *beginTouch;
    UITouch *endTouch;
}

- (IBAction)backPressed:(id)sender;

@end

@implementation MMSlingshotiPadViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [beanBagOutlet setHidden:YES];
    [self initialize];  // clear board ...
    
}

- (void) initialize
{
    int i, j;
    
    for (i=0; i<3; i++)   /* set elements = to dash - */
        for(j=0; j<3; j++)
            tictac[i][j] = '-';
    
    [button1_1_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
    [button1_2_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
    [button1_3_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
    [button2_1_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
    [button2_2_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
    [button2_3_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
    [button3_1_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
    [button3_2_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
    [button3_3_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
    
}

- (int) checkIfWon:(char) letter
{
    int i, j, winner = 0;   /* did someone win ? */
    
    for (i=0; i<3; i++)
        if (tictac[i][0]==letter && tictac[i][1]==letter && tictac[i][2]==letter)
            winner = 1;
    
    for (j=0;j<3;j++)
        if(tictac[0][j]==letter && tictac[1][j]==letter && tictac[2][j]==letter)
            winner = 1;
    
    if(tictac[0][0]==letter && tictac[1][1]==letter && tictac[2][2]==letter)
        winner = 1;
    if(tictac[0][2]==letter && tictac[1][1]==letter && tictac[2][0] == letter)
        winner = 1;
    
    return (winner);
}


- (void) showWin:(char) letterToWin
{
    UIAlertView *alert;
    
    if(letterToWin == 'T')
    {
        alert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                           message:@"Tie Game"
                                          delegate:self
                                 cancelButtonTitle:@"Reset"
                                 otherButtonTitles:nil];
    }
    else
    {
        alert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                           message:[NSString stringWithFormat:@"%c wins", letterToWin]
                                          delegate:self
                                 cancelButtonTitle:@"Reset"
                                 otherButtonTitles:nil];
    }
    
    alert.transform = CGAffineTransformMakeTranslation(0, -140);
    
    [alert show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self initialize];
}


// Handles the start of a touch
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
	// Enumerate through all the touch objects.
	NSUInteger touchCount = 0;
	for (UITouch *touch in touches) {
        
        beginY = [touch locationInView:self.view].y;
        beginX =  [touch locationInView:self.view].x;
        beginTouch = touch;
		touchCount++;
	}
}

// Handles the continuation of a touch.
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSUInteger touchCount = 0;
	// Enumerates through all touch objects
    
	for (UITouch *touch in touches) {
		touchCount++;
        
        if([touch locationInView:self.view].y >= 900 && [touch locationInView:self.view].y < 910)
        {
            [slingshotOutlet setImage:[UIImage imageNamed:@"slingshot2"]];
        }
        else
            if([touch locationInView:self.view].y >= 910 && [touch locationInView:self.view].y < 920)
            {
                [slingshotOutlet setImage:[UIImage imageNamed:@"slingshot3"]];
            }
            else
                if([touch locationInView:self.view].y >= 920 && [touch locationInView:self.view].y < 930)
                {
                    [slingshotOutlet setImage:[UIImage imageNamed:@"slingshot4"]];
                }
                else
                    if([touch locationInView:self.view].y >= 930 && [touch locationInView:self.view].y < 940)
                    {
                        [slingshotOutlet setImage:[UIImage imageNamed:@"slingshot5"]];
                    }
                    else
                        if([touch locationInView:self.view].y >= 940 && [touch locationInView:self.view].y < 950)
                        {
                            [slingshotOutlet setImage:[UIImage imageNamed:@"slingshot6"]];
                        }
                        else
                            if([touch locationInView:self.view].y >= 950 && [touch locationInView:self.view].y < 960)
                            {
                                [slingshotOutlet setImage:[UIImage imageNamed:@"slingshot6"]];
                            }
                            else
                                if([touch locationInView:self.view].y >= 960 && [touch locationInView:self.view].y < 970)
                                {
                                    [slingshotOutlet setImage:[UIImage imageNamed:@"slingshot7"]];
                                }
                                else
                                    if([touch locationInView:self.view].y >= 970 && [touch locationInView:self.view].y < 980)
                                    {
                                        [slingshotOutlet setImage:[UIImage imageNamed:@"slingshot8"]];
                                    }
                                    else
                                        if([touch locationInView:self.view].y >= 980 && [touch locationInView:self.view].y < 990)
                                        {
                                            [slingshotOutlet setImage:[UIImage imageNamed:@"slingshot9"]];
                                        }
                                        else
                                            if([touch locationInView:self.view].y >= 990)
                                            {
                                                [slingshotOutlet setImage:[UIImage imageNamed:@"slingshot10"]];
                                            }
        
        if([touch locationInView:self.view].y > 900) //set X
        {
            [slingshotOutlet setCenter:CGPointMake([touch locationInView:self.view].x, 900)];
        }
	}
}


-(void) animateBeanBag
{
    [UIView animateWithDuration:1
                          delay:0.0
                        options:UIViewAnimationOptionTransitionFlipFromBottom
                     animations:^ void (void)
     {
         int dist = (beginY - endY);
         
         [beanBagOutlet setFrame:CGRectMake(endX, 800 +(dist*7), 100, 100)];
         [beanBagOutlet setTransform:CGAffineTransformMakeRotation(720)];
         [beanBagOutlet setTransform:CGAffineTransformIdentity];
         
         
     } completion:^ void (BOOL isFinished) {
         
         if(isFinished)
         {
             [self updateButton];
             [beanBagOutlet setHidden:YES];
             
             //reset slingshot to center
             [slingshotOutlet setImage:[UIImage imageNamed:@"slingshot1"]];
             [slingshotOutlet setCenter:CGPointMake(411, 900)];
             [self.view setUserInteractionEnabled:YES];
         }
     }];
}


-(void) updateButton
{
    
    if(CGRectContainsPoint([button1_1_Out frame], beanBagOutlet.center))
    {
        NSLog(@"in 11 !!");
        [self updateButtonImage:button1_1_Out];
    }
    else if (CGRectContainsPoint([button1_2_Out frame], beanBagOutlet.center))
    {
        NSLog(@"in 12 !!");
        [self updateButtonImage:button1_2_Out];
        
    }
    else if(CGRectContainsPoint([button1_3_Out frame], beanBagOutlet.center))
    {
        NSLog(@"in 13 !!");
        [self updateButtonImage:button1_3_Out];
        
    }
    
    else if(CGRectContainsPoint([button2_1_Out frame], beanBagOutlet.center))
    {
        NSLog(@"in 21 !!");
        [self updateButtonImage:button2_1_Out];
        
    }
    else if(CGRectContainsPoint([button2_2_Out frame], beanBagOutlet.center))
    {
        NSLog(@"in 22 !!");
        [self updateButtonImage:button2_2_Out];
        
    }
    else if(CGRectContainsPoint([button2_3_Out frame], beanBagOutlet.center))
    {
        NSLog(@"in 23 !!");
        [self updateButtonImage:button2_3_Out];
        
    }
    else if(CGRectContainsPoint([button3_1_Out frame], beanBagOutlet.center))
    {
        NSLog(@"in 31 !!");
        [self updateButtonImage:button3_1_Out];
        
    }
    else if(CGRectContainsPoint([button3_2_Out frame], beanBagOutlet.center))
    {
        NSLog(@"in 32 !!");
        [self updateButtonImage:button3_2_Out];
        
    }
    else if(CGRectContainsPoint([button3_3_Out frame], beanBagOutlet.center))
    {
        NSLog(@"in 33 !!");
        [self updateButtonImage:button3_3_Out];
        
    }
    //winner?
    
    if([self checkIfWon:'X'] == 1)
    {
        [self showWin:'X'];
    }
    else if([self checkIfWon:'O'] == 1)
    {
        [self showWin:'O'];
    }
    
}


-(void) updateButtonImage:(UIButton *)theButton
{
    
    // towards top 1/2 of screen
    if(beanBagOutlet.center.y < theButton.center.y)
    {
        switch (theButton.tag) {
            case 110:
                if(tictac[0][0] == 'X')
                {
                    tictac[0][0] = 'O';
                    [button1_1_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[0][0] == 'O')
                {
                    tictac[0][0] = '-';
                    [button1_1_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[0][0] == '-')
                {
                    tictac[0][0] = 'X';
                    [button1_1_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 120:
                if(tictac[0][1] == 'X')
                {
                    tictac[0][1] = 'O';
                    [button1_2_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[0][1] == 'O')
                {
                    tictac[0][1] = '-';
                    [button1_2_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[0][1] == '-')
                {
                    tictac[0][1] = 'X';
                    [button1_2_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 130:
                if(tictac[0][2] == 'X')
                {
                    tictac[0][2] = 'O';
                    [button1_3_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[0][2] == 'O')
                {
                    tictac[0][2] = '-';
                    [button1_3_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[0][2] == '-')
                {
                    tictac[0][2] = 'X';
                    [button1_3_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 210:
                if(tictac[1][0] == 'X')
                {
                    tictac[1][0] = 'O';
                    [button2_1_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[1][0] == 'O')
                {
                    tictac[1][0] = '-';
                    [button2_1_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[1][0] == '-')
                {
                    tictac[1][0] = 'X';
                    [button2_1_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 220:
                if(tictac[1][1] == 'X')
                {
                    tictac[1][1] = 'O';
                    [button2_2_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[1][1] == 'O')
                {
                    tictac[1][1] = '-';
                    [button2_2_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[1][1] == '-')
                {
                    tictac[1][1] = 'X';
                    [button2_2_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 230:
                if(tictac[1][2] == 'X')
                {
                    tictac[1][2] = 'O';
                    [button2_3_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[1][2] == 'O')
                {
                    tictac[1][2] = '-';
                    [button2_3_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[1][2] == '-')
                {
                    tictac[1][2] = 'X';
                    [button2_3_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 310:
                if(tictac[2][0] == 'X')
                {
                    tictac[2][0] = 'O';
                    [button3_1_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[2][0] == 'O')
                {
                    tictac[2][0] = '-';
                    [button3_1_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[2][0] == '-')
                {
                    tictac[2][0] = 'X';
                    [button3_1_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 320:
                if(tictac[2][1] == 'X')
                {
                    tictac[2][1] = 'O';
                    [button3_2_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[2][1] == 'O')
                {
                    tictac[2][1] = '-';
                    [button3_2_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[2][1] == '-')
                {
                    tictac[2][1] = 'X';
                    [button3_2_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 330:
                if(tictac[2][2] == 'X')
                {
                    tictac[2][2] = 'O';
                    [button3_3_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[2][2] == 'O')
                {
                    tictac[2][2] = '-';
                    [button3_3_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[2][2] == '-')
                {
                    tictac[2][2] = 'X';
                    [button3_3_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            default:
                break;
        }
        
    }
    
    // towrds bottom half of screen
    else if (beanBagOutlet.center.y >= theButton.center.y)
    {
        
        //  [theButton setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateDisabled];
        switch (theButton.tag) {
            case 110:
                if(tictac[0][0] == 'X')
                {
                    tictac[0][0] = '-';
                    [button1_1_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[0][0] == 'O')
                {
                    tictac[0][0] = 'X';
                    [button1_1_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[0][0] == '-')
                {
                    tictac[0][0] = 'O';
                    [button1_1_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 120:
                if(tictac[0][1] == 'X')
                {
                    tictac[0][1] = '-';
                    [button1_2_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[0][1] == 'O')
                {
                    tictac[0][1] = 'X';
                    [button1_2_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[0][1] == '-')
                {
                    tictac[0][1] = 'O';
                    [button1_2_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 130:
                if(tictac[0][2] == 'X')
                {
                    tictac[0][2] = '-';
                    [button1_3_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[0][2] == 'O')
                {
                    tictac[0][2] = 'X';
                    [button1_3_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[0][2] == '-')
                {
                    tictac[0][2] = 'O';
                    [button1_3_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 210:
                if(tictac[1][0] == 'X')
                {
                    tictac[1][0] = '-';
                    [button2_1_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[1][0] == 'O')
                {
                    tictac[1][0] = 'X';
                    [button2_1_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[1][0] == '-')
                {
                    tictac[1][0] = 'O';
                    [button2_1_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 220:
                if(tictac[1][1] == 'X')
                {
                    tictac[1][1] = '-';
                    [button2_2_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[1][1] == 'O')
                {
                    tictac[1][1] = 'X';
                    [button2_2_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[1][1] == '-')
                {
                    tictac[1][1] = 'O';
                    [button2_2_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 230:
                if(tictac[1][2] == 'X')
                {
                    tictac[1][2] = '-';
                    [button2_3_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[1][2] == 'O')
                {
                    tictac[1][2] = 'X';
                    [button2_3_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[1][2] == '-')
                {
                    tictac[1][2] = 'O';
                    [button2_3_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 310:
                if(tictac[2][0] == 'X')
                {
                    tictac[2][0] = '-';
                    [button3_1_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[2][0] == 'O')
                {
                    tictac[2][0] = 'X';
                    [button3_1_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[2][0] == '-')
                {
                    tictac[2][0] = 'O';
                    [button3_1_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 320:
                if(tictac[2][1] == 'X')
                {
                    tictac[2][1] = '-';
                    [button3_2_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[2][1] == 'O')
                {
                    tictac[2][1] = 'X';
                    [button3_2_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[2][1] == '-')
                {
                    tictac[2][1] = 'O';
                    [button3_2_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            case 330:
                if(tictac[2][2] == 'X')
                {
                    tictac[2][2] = '-';
                    [button3_3_Out setBackgroundImage:[UIImage imageNamed:@"XObackgroundWithXO.png"] forState: UIControlStateDisabled];
                }
                else if(tictac[2][2] == 'O')
                {
                    tictac[2][2] = 'X';
                    [button3_3_Out setBackgroundImage:[UIImage imageNamed:@"X_iPad.png"] forState:UIControlStateDisabled];
                }
                else if(tictac[2][2] == '-')
                {
                    tictac[2][2] = 'O';
                    [button3_3_Out setBackgroundImage:[UIImage imageNamed:@"O_iPad.png"] forState:UIControlStateDisabled];
                }
                break;
            default:
                break;
        }
    }
    
}

// Handles the end of a touch event.
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	// Enumerates through all touch object
	for (UITouch *touch in touches) {
        
        endY = [touch locationInView:self.view].y;
        endX = [touch locationInView:self.view].x;
		
        if (beginY > 600 && beginY  < endY)
        {
            [self.view setUserInteractionEnabled:NO];
            
            [beanBagOutlet setHidden:NO];
            [beanBagOutlet setFrame:CGRectMake(slingshotOutlet.center.x-20, slingshotOutlet.center.y-100, 85, 85)];
            [self animateBeanBag];
        }
    }
}

- (void)viewDidUnload {
    beanBagOutlet = nil;
    slingshotOutlet = nil;
    button1_1_Out = nil;
    [super viewDidUnload];
}

- (IBAction)backPressed:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
