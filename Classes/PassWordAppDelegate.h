//
//  PassWordAppDelegate.h
//  PassWord
//
//  Created by Li Haiyang on 12-4-3.
//  Copyright 2012 __njcit__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PassWordViewController;

@interface PassWordAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PassWordViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PassWordViewController *viewController;

@end

