//
//  AccountCreationService.h
//  Boba
//
//  Created by Danny Huang on 7/6/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface AccountCreationService : NSObject

+ (AFHTTPRequestOperation *)postAccountCreationWithCredentials:(NSArray *)credentials andBlock:(void(^)(BOOL success, NSError *error, NSInteger statusCode))block;

@end
