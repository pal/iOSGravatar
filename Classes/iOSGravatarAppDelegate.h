//
//  iOSGravatarAppDelegate.h
//  iOSGravatar
//
//  Created by Pål Brattberg on 2/24/11.
//  Copyright 2011 Acando. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iOSGravatarViewController;

@interface iOSGravatarAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iOSGravatarViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iOSGravatarViewController *viewController;

@end

