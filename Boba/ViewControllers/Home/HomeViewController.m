//
//  HomeViewController.m
//  Boba
//
//  Created by Danny Huang on 6/20/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import "HomeViewController.h"
#import "AccountCreateViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Boba";
}

- (IBAction)signUp:(id)sender {
    AccountCreateViewController *vc= [[AccountCreateViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
