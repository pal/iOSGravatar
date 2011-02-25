//
//  iOSGravatarViewController.h
//  iOSGravatar
//
//  Created by Pål Brattberg on 2/24/11.
//  Copyright 2011 Acando. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iOSGravatarViewController : UIViewController {
	UITextField *textField;
	UIImageView *imageView;
}

@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

- (IBAction) showGravatar;

+ (NSString *) md5:(NSString *)str;

@end
