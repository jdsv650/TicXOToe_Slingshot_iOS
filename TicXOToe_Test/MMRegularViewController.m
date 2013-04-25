//
//  MMRegularViewController.m
//  TicXOToe_Test
//
//  Created by James Donner on 4/5/13.
//  Copyright (c) 2013 jdsv650. All rights reserved.
//

#import "MMRegularViewController.h"


char tictac[3][3];
int row,col;

@interface MMRegularViewController ()
{
    __weak IBOutlet UIButton *button1_1_Outlet;
    __weak IBOutlet UIButton *button1_2_Outlet;
    __weak IBOutlet UIButton *button1_3_Outlet;
    __weak IBOutlet UIButton *button2_1_Outlet;
    __weak IBOutlet UIButton *button2_2_Outlet;
    __weak IBOutlet UIButton *button2_3_Outlet;
    __weak IBOutlet UIButton *button3_1_Outlet;
    __weak IBOutlet UIButton *button3_2_Outlet;
    __weak IBOutlet UIButton *button3_3_Outlet;
  
   // BOOL isVersusComp;
    BOOL isPlayerX;
}

- (IBAction)getUserMove:(id)sender;
- (IBAction)backButton:(id)sender;


@end

@implementation MMRegularViewController
@synthesize isVersusComp;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initialize];  // Clear board '-'
    // set in prepareForSegue isVersusComp = YES;
    isPlayerX = YES;
}


- (void) initialize
{
    int i, j;
    
    for (i=0; i<3; i++)   /* set elements = to dash - */
        for(j=0; j<3; j++)
            tictac[i][j] = '-';
    
    [button1_1_Outlet setBackgroundImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
    [button1_2_Outlet setBackgroundImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
    [button1_3_Outlet setBackgroundImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
    [button2_1_Outlet setBackgroundImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
    [button2_2_Outlet setBackgroundImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
    [button2_3_Outlet setBackgroundImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
    [button3_1_Outlet setBackgroundImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
    [button3_2_Outlet setBackgroundImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
    [button3_3_Outlet setBackgroundImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
    
}


- (void) computerMove /* if no win or block make a move */
{
    if(tictac[2][1] == 'X' && tictac [1][2] =='X' && tictac[2][2] == '-') {
        tictac[2][2] = 'O';
        // drawO(2,2,2);
        [button3_3_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
    }
    else if(tictac[1][1] == '-')  {
        tictac[1][1] = 'O';
        // drawO(1,1,2);
        [button2_2_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        
    }
    else if(tictac[0][0] == '-' && (tictac[0][2] != 'X' || tictac[2][0] != 'X'))  {
        tictac[0][0] = 'O';
        // drawO(0,0,2);
        [button1_1_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        
    }
    else if (tictac[2][2] == '-' && (tictac[0][2] !='X' || tictac[2][0] !='X'))   {
	    tictac[2][2] = 'O';
	    //drawO(2,2,2);
        [button3_3_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        
    }
    else if (tictac[2][0] == '-'&& (tictac[0][0] != 'X' || tictac[2][2] != 'X')) {
	    tictac[2][0] = 'O';
	    //drawO(2,0,2);
        [button3_1_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        
    }
    else if (tictac[0][2] == '-' && (tictac[0][0] !='X' || tictac[2][2] !='X')) {
	    tictac[0][2] = 'O';
        // drawO(0,2,2);
        [button1_3_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        
    }
    else if (tictac[1][0] == '-') {
	    tictac[1][0] = 'O';
        // drawO(1,0,2);
        [button2_1_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        
    }
    else if (tictac[2][1] == '-') {
        tictac[2][1] = 'O';
        // drawO(2,1,2);
        [button3_2_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        
    }
    else if (tictac[1][2] == '-') {
        tictac[1][2] = 'O';
        // drawO(1,2,2);
        [button2_3_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        
    }
    else if (tictac[0][1] == '-')  {
        tictac[0][1] = 'O';
        // drawO(0,1,2);
        [button1_2_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        
    }
    else
    {
        NSLog(@"TIE GAME\n");
        [self showWin:'T'];
    }
    
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

- (int) winPossible:(char) letter
{
    int row,col;
    
    for(row =0; row<3; row++)
    {
        for(col=0; col<3; col++)
        {
            if (tictac[row][col] == '-')
            {
                tictac[row][col] = letter;
                if([self checkIfWon:(letter)] == 0)
                    tictac[row][col] = '-';
                else
                {
                    tictac[row][col] = 'O';
                    // drawO(row,col,2);
                    //block
                    if(row == 0 & col == 0)
                        [button1_1_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
                    
                    if(row == 0 & col == 1)
                        [button1_2_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
                    
                    if(row == 0 & col == 2)
                        [button1_3_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
                    
                    if(row == 1 & col == 0)
                        [button2_1_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
                    
                    if(row == 1 & col == 1)
                        [button2_2_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
                    
                    if(row == 1 & col == 2)
                        [button2_3_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
                    
                    if(row == 2 & col == 0)
                        [button3_1_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
                    
                    if(row == 2 & col == 1)
                        [button3_2_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
                    
                    if(row == 2 & col == 2)
                        [button3_3_Outlet setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
                    return (1);
                }
            }
        }
    }
    
    return(0);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    
    [super viewDidUnload];
}


- (IBAction)getUserMove:(id)sender
{
    switch ([sender tag]) {
        case 11:
            row = 0;
            col = 0;
            break;
        case 12:
            row = 0;
            col = 1;
            break;
        case 13:
            row = 0;
            col = 2;
            break;
        case 21:
            row = 1;
            col = 0;
            break;
        case 22:
            row = 1;
            col = 1;
            break;
        case 23:
            row = 1;
            col = 2;
            break;
        case 31:
            row = 2;
            col = 0;
            break;
        case 32:
            row = 2;
            col = 1;
            break;
        case 33:
            row = 2;
            col = 2;
            break;
        default:
            break;
    }
    
    if(tictac[row][col] != '-')
    {
        return;
    }
    
    if(isPlayerX && !isVersusComp) {
        [sender setBackgroundImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
        tictac[row][col] = 'X';  /* make move for 'X' */
        if ([self checkIfWon:('X') ] == 1)  {
            NSLog(@"X wins\n");
            [self showWin:'X'];
        }
        else
            if([self isBoardFull])
            {
                [self showWin:('T')];
            }
        isPlayerX = NO;
    }
    else
        if(!isPlayerX && !isVersusComp)
        {
            [sender setBackgroundImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
            tictac[row][col] = 'O';  /* make move for 'O' */
            if ([self checkIfWon:('O') ] == 1)  {
                NSLog(@"O wins\n");
                [self showWin:'O'];
            }
            else
                if([self isBoardFull])
                {
                    [self showWin:('T')];
                }
            isPlayerX = YES;
        }
        else  // versus computer
        {
            [sender setBackgroundImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
            tictac[row][col] = 'X';  /* make move for 'X' */
        }
    
    if(isVersusComp)
    {
        if ([self checkIfWon:('X') ] == 1)  {
            NSLog(@"X wins\n");
            [self showWin:'X'];
        }
        else
            if ([self winPossible:('O')] == 1) {
                NSLog(@"O WINS\n");
                [self showWin:'O'];
            }
            else
                if ([self winPossible:('X')] == 0) {
                    /* if opponent does not have to be blocked make move */
                    [self computerMove];
                }
    }
    
    
}

- (BOOL) isBoardFull
{
    BOOL isFull = YES;
    
    for(int i=0; i<3; i++)
        for(int j=0; j<3; j++)
        {
            if(tictac[i][j] == '-')
            {
                isFull = NO;
            }
        }
    
    return isFull;
}

- (IBAction)versusComputer:(id)sender
{
    //reset
    [self initialize];
    
    if([sender isOn])
    {
        isVersusComp = YES;
    }
    else
    {
        isVersusComp = NO;
    }
    
}

- (IBAction)backButton:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
    
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
    
    alert.transform = CGAffineTransformMakeTranslation(0, 180);
    
    [alert show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self initialize];
}




@end


