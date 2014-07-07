//
//  StringUtility.m
//  Boba
//
//  Created by Danny Huang on 7/6/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import "StringUtility.h"

#define PHONE_NUMBER_LENGTH 11

@implementation StringUtility

+ (BOOL)checkIfStringContainSpecialCharacter:(NSString *)givenString {
    NSCharacterSet * set = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789"] invertedSet];
    
    if ([givenString rangeOfCharacterFromSet:set].location != NSNotFound) {
        NSLog(@"This string contains illegal characters");
        return YES;
    }
    return NO;
}

+ (BOOL)checkIfEmailIsValid:(NSString*)emailString {
    NSString *regExPattern = @"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\\])";
    
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    
    if (regExMatches == 0) {
        return NO;
    } else
        return YES;
}

+ (BOOL)checkIfPhoneNumberIsValid:(NSString*)phoneNumber {
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([phoneNumber rangeOfCharacterFromSet:notDigits].location == NSNotFound) {
        if (phoneNumber.length != PHONE_NUMBER_LENGTH) {
            return NO;
        }
        return YES;
    }
    return NO;
}

@end
