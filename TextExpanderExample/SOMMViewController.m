//
//  SOMMViewController.m
//  TextExpanderExample
//
//  Created by Robert Cantoni on 2/20/13.
//  Copyright (c) 2013 Smile Software. All rights reserved.
//

#import "SOMMViewController.h"

@interface SOMMViewController ()

@end

@implementation SOMMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.textExpander = [[SMTEDelegateController alloc] init];
    [self.textView setDelegate:self.textExpander];
    [self.textExpander setNextDelegate:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
