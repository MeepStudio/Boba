//
//  User.h
//  Boba
//
//  Created by Danny Huang on 6/20/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

/**
 *  the id of the user
 */
@property (nonatomic) NSString *userId;

/**
 *  the user's name
 */
@property (nonatomic) NSString *userName;

/**
 *  the user's current password
 */
@property (nonatomic) NSString *userPassword;

/**
 *  the user's email
 */
@property (nonatomic) NSString *userEmail;

@end
