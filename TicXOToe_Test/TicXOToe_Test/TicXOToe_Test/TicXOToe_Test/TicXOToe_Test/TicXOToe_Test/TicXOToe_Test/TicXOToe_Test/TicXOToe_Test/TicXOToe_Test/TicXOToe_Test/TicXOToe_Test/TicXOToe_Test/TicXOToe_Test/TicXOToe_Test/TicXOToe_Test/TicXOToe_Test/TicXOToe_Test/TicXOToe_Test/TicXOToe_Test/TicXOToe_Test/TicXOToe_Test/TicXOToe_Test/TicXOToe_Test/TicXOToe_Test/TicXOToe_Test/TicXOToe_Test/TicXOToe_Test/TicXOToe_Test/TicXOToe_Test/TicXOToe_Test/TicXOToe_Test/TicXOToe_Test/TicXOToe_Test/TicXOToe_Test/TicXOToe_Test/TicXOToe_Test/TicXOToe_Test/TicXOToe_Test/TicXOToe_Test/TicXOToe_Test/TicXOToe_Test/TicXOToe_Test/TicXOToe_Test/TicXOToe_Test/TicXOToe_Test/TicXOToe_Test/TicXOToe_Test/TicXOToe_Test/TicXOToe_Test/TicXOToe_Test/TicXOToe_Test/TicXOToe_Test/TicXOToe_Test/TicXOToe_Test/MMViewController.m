//
//  MMViewController.m
//  TicXOToe_Test
//
//  Created by James Donner on 4/5/13.
//  Copyright (c) 2013 jdsv650. All rights reserved.
//

#import "MMViewController.h"
#include<stdio.h>

char tictac[3][3];
int row,col;

@interface MMViewController ()
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
}

@end

@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
        [button1_1_Outlet setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
        [button1_2_Outlet setImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
        [button1_3_Outlet setImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
        [button2_1_Outlet setBackgroundImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
    
    button1_1_Outlet.imageView.image = [UIImage imageNamed:@"X.png"];
    
    int count;
    char playagain;
    
    [self instructions];
    
   // while(1)
   // {
        [self initialize];  // Clear board '-'
        [self getusermove];
        [self computermove];
        [self drawBoard];
        
        count = 2;
        do
        {
            [self getusermove];
            [self drawBoard];
            //printf("-----------------\n");
            
            count++;
            if ([self checkifwon:('X') ] == 1)  {
             //   printf("X wins\n");
                [self drawBoard];
                break;
            }
            else
                if ([self winpossible:('O')] == 1) {
                    //drawO(10,38,0);  /* if won draw O and tell user O wins */
                 //   printf("O WINS\n");
                    [self drawBoard];
                    break;
                }
                else
                    if ([self winpossible:('X')] == 0) {
                        /* if opponent does not have to be blocked make move */
                        [self computermove];
                    }
            count++;
            [self drawBoard];
        }
        while (count < 9);  /* end while loop */
        
       // printf("Play again (y n) ==> ");
       // scanf(" %c",&playagain);
        
       // if (playagain != 'y' && playagain != 'Y')
         //   break;   /* end game ? */
   // }
    
}


- (void) instructions
{
//    char dummy;
//    
//    printf("\n\tWELCOME to the Tic Tac Toe game");
//    printf("\n\tYou will play X and I will play O ");
//    printf("\n\tthe board is arranged as follows");
//    printf("\n\n\t            COLUMN");
//    printf("\n\t          1   2   3");
//    printf("\n\t       1  -   -   -");
//    printf("\n\t  ROW  2  X   -   -");
//    printf("\n\t       3  -   -   O");
//    printf("\n\n\t  O is at ROW 3 COLUMN 3");
//    printf("\n\t  X is at ROW 2 COLUMN 1");
//    printf("\n\tYou will prompted to enter a row # and a column # ");
//    printf("\n\tPress any key to begin => ");
//    dummy = getchar();
}




- (void) drawBoard
{
    int i, j;
    
    for (i=0;i<3;i++) {
        for(j=0;j<3;j++)
            ;
           // printf("%c\t", tictac[i][j]);
    }
}



- (void) initialize
{
    int i, j;
    
    for (i=0; i<3; i++)   /* set elements = to dash - */
        for(j=0; j<3; j++)
            tictac[i][j] = '-';
    
//    [button1_1_Outlet setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
//    [button1_2_Outlet setImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
//    [button1_3_Outlet setImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
//    [button2_1_Outlet setImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
//    [button2_2_Outlet setImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
//    [button2_3_Outlet setImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
//    [button3_1_Outlet setImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
//    [button3_2_Outlet setImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
//    [button3_3_Outlet setImage:[UIImage imageNamed:@"XObackground.png"] forState:UIControlStateNormal];
    
    // [button3_3_Outlet setImage:[UIImage imageWithContentsOfFile:@"XObackground.png"] forState:UIControlStateNormal];

}


- (void) getusermove
{
  
    
    while (1)   /* while invalid move loop back and get new move */
    {
      //  printf("\n");
      //  printf("Enter row # ==> ");
      //  scanf("%d",&row);
      //  printf("\nEnter column # ==> ");
      //  scanf("%d",&col);
        if (row <= 3 && row >= 1 && col <= 3 && col >= 1 && tictac[--row][--col] == '-')
            break;  /* if valid entry && array cell empty stop reading */
    }   /* end loop */
    
    tictac[row][col] = 'X';  /* make move for 'X' */
    
    /******
     if (row == 0)
     if (col == 0)
     drawX(2,24,6);
     else if(col ==1)
     drawX(2,37,6);
     else if(col == 2)   // print X on screen
     drawX(2,50,6);
     else; else;
     if (row == 1)
     if (col == 0)
     drawX(8,24,6);
     else if (col == 1)
     drawX(8,37,6);
     else if (col ==2)
     drawX(8,50,6);
     else;   else;
     if (row == 2)
  	 if (col == 0)
     drawX(14,24,6);
  	 else if (col == 1)
     drawX(14,37,6);
  	 else if (col == 2)
     drawX(14,50,6);
     else; else;
     ****************/
}

- (void) computermove /* if no win or block make a move */
{
    if(tictac[2][1] == 'X' && tictac [1][2] =='X' && tictac[2][2] == '-') {
        tictac[2][2] = 'O';
        // drawO(2,2,2);
    }
    else if(tictac[1][1] == '-')  {
        tictac[1][1] = 'O';
        // drawO(1,1,2);
    }
    else if(tictac[0][0] == '-' && (tictac[0][2] != 'X' || tictac[2][0] != 'X'))  {
        tictac[0][0] = 'O';
        // drawO(0,0,2);
    }
    else if (tictac[2][2] == '-' && (tictac[0][2] !='X' || tictac[2][0] !='X'))   {
	    tictac[2][2] = 'O';
	    //drawO(2,2,2);
    }
    else if (tictac[2][0] == '-'&& (tictac[0][0] != 'X' || tictac[2][2] != 'X')) {
	    tictac[2][0] = 'O';
	    //drawO(2,0,2);
    }
    else if (tictac[0][2] == '-' && (tictac[0][0] !='X' || tictac[2][2] !='X')) {
	    tictac[0][2] = 'O';
        // drawO(0,2,2);
    }
    else if (tictac[1][0] == '-') {
	    tictac[1][0] = 'O';
        // drawO(1,0,2);
    }
    else if (tictac[2][1] == '-') {
        tictac[2][1] = 'O';
        // drawO(2,1,2);
    }
    else if (tictac[1][2] == '-') {
        tictac[1][2] = 'O';
        // drawO(1,2,2);
    }
    else if (tictac[0][1] == '-')  {
        tictac[0][1] = 'O';
        // drawO(0,1,2);
    }
   // else
     //   printf("TIE GAME\n");
    
}


- (int) checkifwon:(char) letter
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

- (int) winpossible:(char) letter
{
    int row,col;
    
    for(row =0; row<3; row++)
    {
        for(col=0; col<3; col++)
        {
            if (tictac[row][col] == '-')
            {
                tictac[row][col] = letter;
                if([self checkifwon:(letter)] == 0)
                    tictac[row][col] = '-';
                else
                {
                    tictac[row][col] = 'O';
                    // drawO(row,col,2);
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

@end
