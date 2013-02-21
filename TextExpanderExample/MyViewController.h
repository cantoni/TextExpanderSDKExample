//
//  MyViewController.h
//  TextExpanderExample
//
//  Created by Robert Cantoni on 2/20/13.
//

#import <UIKit/UIKit.h>
#import <TextExpander/SMTEDelegateController.h>

@interface MyViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic) SMTEDelegateController *textExpander;

@end
