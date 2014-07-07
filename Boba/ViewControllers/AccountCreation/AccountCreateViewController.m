//
//  AccountCreateViewController.m
//  Boba
//
//  Created by Danny Huang on 7/3/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import "AccountCreateViewController.h"
#import "StringUtility.h"

#define MIN_LENGTH 4
#define MAX_LENGTH 20

@interface AccountCreateViewController () <UITextFieldDelegate> {
    CGFloat screenWidth;
    CGFloat screenHeight;
}

@property (nonatomic) IBOutlet UITextField *nameTextField;
@property (nonatomic) IBOutlet UITextField *passwordTextField;
@property (nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (nonatomic) IBOutlet UITextField *emailTextField;
@property (nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (nonatomic) UITextField *currentTextfield;

@end

@implementation AccountCreateViewController

#pragma mark - View LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Sign Up";
    
    //sets the delegate for textfields;
    self.nameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.confirmPasswordTextField.delegate = self;
    self.emailTextField.delegate = self;
    self.phoneNumberTextField.delegate = self;
    
    //gets the sreen size
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Finish" style:UIBarButtonItemStyleBordered target:self action:@selector(finish)];
    self.navigationItem.rightBarButtonItem = barButton;
    
}

- (void)viewDidAppear:(BOOL)animated {
    //adds notification for showing the keyboard
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)dealloc {
    //removes the keyboard notification
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - Helper Methods
/**
 *  moves the keyboard up according to the current selected textfield with animation
 *
 *  @param  a NSNotfication object, but it will be nil as of now.
 *
 *  @return void;
 */
- (void)keyboardDidShow:(NSNotification *)notification {
    if (self.currentTextfield == self.confirmPasswordTextField) {
        [UIView animateWithDuration:0.1f animations:^{
            [self.view setFrame:CGRectMake(0,-35,screenWidth,screenHeight)];
        }];
    }
    if (self.currentTextfield == self.phoneNumberTextField) {
        [UIView animateWithDuration:0.1f animations:^{
            [self.view setFrame:CGRectMake(0, -115, screenWidth, screenHeight)];
        }];
    }
}

/**
 *  hides the keyboard with animation
 *
 *  @param notification a NSNotfication object, but it will be nil as of now.
 */
- (void)keyboardDidHide:(NSNotification *)notification {
    [UIView animateWithDuration:0.1f animations:^{
        [self.view setFrame:CGRectMake(0,0,screenWidth,screenHeight)];
    }];
}

/**
 *  the user has finished 
 */
- (void)finish {
    UIAlertView *alert = [[UIAlertView alloc] init];
    if (self.nameTextField.text.length < MIN_LENGTH || self.nameTextField.text.length > MAX_LENGTH) {
        alert.title = @"Wrong Email Length";
        alert.message = [NSString stringWithFormat:@"Your username must be longer than %d and shorter than %d",MIN_LENGTH-1,MAX_LENGTH-1];
        return;
    }
    if (self.passwordTextField.text.length < MIN_LENGTH || self.nameTextField.text.length > MAX_LENGTH) {
        alert.title = @"Wrong Email Length";
        alert.message = [NSString stringWithFormat:@"Your username must be longer than %d and shorter than %d",MIN_LENGTH-1,MAX_LENGTH-1];
        return;;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    self.currentTextfield = nil;
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.nameTextField) {
        [self.emailTextField becomeFirstResponder];
    }
    else if (textField == self.emailTextField) {
        [self.passwordTextField becomeFirstResponder];
    }
    else if (textField == self.passwordTextField) {
        [self.confirmPasswordTextField becomeFirstResponder];
    }
    else if (textField == self.confirmPasswordTextField) {
        [self.phoneNumberTextField becomeFirstResponder];
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.currentTextfield = textField;
    [self keyboardDidShow:nil];
}

@end
