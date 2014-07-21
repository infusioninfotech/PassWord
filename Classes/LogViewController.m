    //
//  LogViewController.m
//  PassWord
//
//  Created by njcit on 12-4-3.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "LogViewController.h"
#import "SFHFKeychainUtils.h"
#import "PassWordViewController.h"
@implementation LogViewController
@synthesize user,password,ensurePassword;
-(IBAction) logButtonPressed:(id) sender
{
	
	if(user.text.length==0||password.text.length==0||ensurePassword.text.length==0)
	{
		UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"用户名或密码不能为空" message:@"请键入用户名或密码" delegate:self cancelButtonTitle:@"OK,I know" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
	}
	else 
	{
		[SFHFKeychainUtils storeUsername:user.text andPassword:password.text forServiceName:@"passwordTest" updateExisting:YES error:nil];
		UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"注册成功" message:nil delegate:self cancelButtonTitle:@"OK,I know" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
	
		//[[[[UIApplication sharedApplication] windows] objectAtIndex:0] addSubview:[PassWordViewController sharedPassWordViewController].view];
		[self.view removeFromSuperview];
	}
	
	
}
-(IBAction) userComplete:(id) sender
{
	if([SFHFKeychainUtils getPasswordForUsername:user.text andServiceName:@"passwordTest" error:nil])
	{
		UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"用户名已存在" message:@"请重新选择用户名" delegate:self cancelButtonTitle:@"OK,I know" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
		user.text=nil;
	}
	
}
-(IBAction) ensurePasswordComplete:(id) sender
{
	if(![ensurePassword.text isEqualToString:password.text])
	{
		UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"两次输入密码不相同" message:@"重新确认" delegate:self cancelButtonTitle:@"OK,I know" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
		ensurePassword.text=nil;
		password.text=nil;
		
	}
}
/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
