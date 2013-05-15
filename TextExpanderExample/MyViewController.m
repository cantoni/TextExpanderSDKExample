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
	
	self.textView.text = @"This app is one big text view. Tap anywhere to start typing and try out some TextExpander snippets.";
	
	BOOL allowFormatting = ([NSParagraphStyle class] != nil);	// iOS 6 and above
	// So formatted snippets expand with their attributes
	if (allowFormatting)
	    [self.textView setAllowsEditingTextAttributes:YES];

	// properties for fill-in snippets
	self.textExpander.fillCompletionScheme = @"textexpanderexample";	// (we have to declare and handle this)
	self.textExpander.fillForAppName = @"TE Example";
	self.textExpander.fillDelegate = self;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//---------------------------------------------------------------
// These three methods implement the SMTEFillDelegate protocol to support fill-ins

/* When an abbreviation for a snippet that looks like a fill-in snippet has been
 * typed, SMTEDelegateController will call your fill delegate's implementation of
 * this method.
 * Provide some kind of identifier for the given UITextView/UITextField/UISearchBar/UIWebView
 * The ID doesn't have to be fancy, "maintext" or "searchbar" will do.
 * Return nil to avoid the fill-in app-switching process (the snippet will be expanded
 * with "(field name)" where the fill fields are).
 *
 * Note that in the case of a UIWebView, the uiTextObject passed will actually be
 * an NSDictionary with two of these keys:
 *     - SMTEkWebView          The UIWebView object (key always present)
 *     - SMTEkElementID        The HTML element's id attribute (if found, preferred over Name)
 *     - SMTEkElementName      The HTML element's name attribute (if id not found and name found)
 * (If no id or name attribute is found, fill-in's cannot be supported, as there is
 * no way for TE to insert the filled-in text.)
 * Unless there is only one editable area in your web view, this implies that the returned
 * identifier string needs to include element id/name information. Eg. "webview-field2".
 */


// These three methods implement the SMTEFillDelegate protocol to support fill-ins

- (NSString*)identifierForTextArea: (id)uiTextObject {
	NSString *result = nil;
	if (self.textView == uiTextObject)
		result =  @"myTextView";
	
	return result;
}

- (BOOL)prepareForFillSwitch: (NSString*)textIdentifier {
	// At this point the app should save state since TextExpander touch is about
	// to activate.
	// It especially needs to save the contents of the textview/textfield!
	return YES;
}

- (id)makeIdentifiedTextObjectFirstResponder: (NSString*)textIdentifier
							 fillWasCanceled: (BOOL)userCanceledFill
							  cursorPosition: (NSInteger*)ioInsertionPointLocation; {
	if ([@"myTextView" isEqualToString: textIdentifier]) {
		[self.textView becomeFirstResponder];
		UITextPosition *theLoc = [self.textView positionFromPosition: self.textView.beginningOfDocument
															  offset: *ioInsertionPointLocation];
		if (theLoc != nil)
			self.textView.selectedTextRange = [self.textView textRangeFromPosition: theLoc toPosition: theLoc];
		return self.textView;
	}
	return nil;
}



@end
