//
//  MyViewController.m
//  TextExpanderExample
//
//  Created by Robert Cantoni on 2/20/13.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

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
