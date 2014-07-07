//
//  StringUtility.m
//  Boba
//
//  Created by Danny Huang on 7/6/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import "StringUtility.h"

@implementation StringUtility

+ (BOOL)checkIfStringContainSpecialCharacter:(NSString *)givenString {
    NSCharacterSet * set = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789"] invertedSet];
    
    if ([givenString rangeOfCharacterFromSet:set].location != NSNotFound) {
        NSLog(@"This string contains illegal characters");
        return NO;
    }
    return YES;
}

@end
