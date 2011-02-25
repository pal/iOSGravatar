//
//  iOSGravatarViewController.m
//  iOSGravatar
//
//  Created by Pål Brattberg on 2/24/11.
//  Copyright 2011 Acando. All rights reserved.
//

#import "iOSGravatarViewController.h"
#import <CommonCrypto/CommonDigest.h>

@implementation iOSGravatarViewController

@synthesize textField;
@synthesize imageView;

-(void) showGravatar 
{
	LOG_INFO(@"Source email: '%@'", self.textField.text);
	
	NSString* lcString = [self.textField.text lowercaseString];
	LOG_INFO(@"Lowercase version: '%@'", lcString);
	
	NSString* md5 = [iOSGravatarViewController md5:lcString];
	LOG_INFO(@"md5 hash: '%@'", md5);
	
	NSString* url = [NSString stringWithFormat:@"http://www.gravatar.com/avatar/%@?d=mm&s=171",md5];
	LOG_INFO(@"URL: '%@'", url);
	
	NSURL* aURL = [NSURL URLWithString:url];
    NSData* data = [[NSData alloc] initWithContentsOfURL:aURL];
	[self.imageView setImage:[UIImage imageWithData:data]];
    [data release];
}

// Source http://amcmillan.livejournal.com/155200.html
// Gravatar wants lowercase MD5 however, so that was changed
+ (NSString *) md5:(NSString *)str {
	const char *cStr = [str UTF8String];
	unsigned char result[16];
	CC_MD5( cStr, strlen(cStr), result );
	return [NSString stringWithFormat:
			@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
			result[0], result[1], result[2], result[3], 
			result[4], result[5], result[6], result[7],
			result[8], result[9], result[10], result[11],
			result[12], result[13], result[14], result[15]
			]; 
}

// Set initial focus on the textfield
-(void) viewWillAppear:(BOOL)animated {
	[self.textField becomeFirstResponder];
}

- (void)viewDidUnload {
	self.imageView = nil;
	self.textField = nil;
}

- (void)dealloc {
	[self.imageView release];
	[self.textField release];
    [super dealloc];
}

@end
