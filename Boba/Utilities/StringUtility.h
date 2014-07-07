//
//  StringUtility.h
//  Boba
//
//  Created by Danny Huang on 7/6/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtility : NSObject
/**
 *  check if String contains special character
 *
 *  @param givenString the given string
 *
 *  @return returns yes if does contain special character
 */
+ (BOOL)checkIfStringContainSpecialCharacter:(NSString *)givenString;

/**
 *  check if email is valid
 *
 *  @param emailString the given email
 *
 *  @return yes if validated
 */
+ (BOOL)checkIfEmailIsValid:(NSString*)emailString;

/**
 *  check if phoneNumber is in the right format
 *  The format is “14089999999”
 *
 *  @param phoneNumber the given phoneNumber
 *
 *  @return yes if valid
 */
+ (BOOL)checkIfPhoneNumberIsValid:(NSString*)phoneNumber;

@end
