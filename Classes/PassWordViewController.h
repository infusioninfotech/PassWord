//
//  PassWordViewController.h
//  PassWord
//
//  Created by njcit on 12-4-3.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PassWordViewController : UIViewController 
{
	UITextField *user;
	UITextField *password;
}
@property (retain,nonatomic) IBOutlet UITextField *user;
@property (retain,nonatomic) IBOutlet UITextField *password ;
-(IBAction) logButtonPressed:(id) sender;
-(IBAction) landButtonPressed:(id) sender;

@end

