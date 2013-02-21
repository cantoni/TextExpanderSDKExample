//
//  SOMMViewController.h
//  TextExpanderExample
//
//  Created by Robert Cantoni on 2/20/13.
//  Copyright (c) 2013 Smile Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TextExpander/SMTEDelegateController.h>

@interface SOMMViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic) SMTEDelegateController *textExpander;

@end
