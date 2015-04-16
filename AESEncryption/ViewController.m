//
//  ViewController.m
//  AESEncryption
//
//  Created by  on 12-1-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Encryption.h"

@implementation ViewController


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSString *key = @"my password";
    NSString *secret = @"text to encrypt";
    //加密
    NSData *plain = [secret dataUsingEncoding:NSUTF8StringEncoding];
    NSData *cipher = [plain AES256EncryptWithKey:key];
    NSLog(@"%@",[[cipher newStringInBase64FromData] autorelease]);
    printf("%s\n", [[cipher description] UTF8String]);
    NSLog(@"%@", [[[NSString alloc] initWithData:cipher encoding:NSUTF8StringEncoding] autorelease]);//打印出null,这是因为没有解密。
    //解密
    plain = [cipher AES256DecryptWithKey:key];
    printf("%s\n", [[plain description] UTF8String]);
    NSLog(@"%@", [[[NSString alloc] initWithData:plain encoding:NSUTF8StringEncoding] autorelease]);
    //打印出secret的内容,用密码解密过了。如果使用错误的密码，则打印null
    
    
}


@end
