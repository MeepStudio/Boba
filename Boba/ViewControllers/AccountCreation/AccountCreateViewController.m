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
 *  the user has filled out everything
 *  check if all the credentials are correct
 *  if it is, then we will call the PUT request
 */
- (void)finish {
    BOOL valid = NO;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    if (self.nameTextField.text.length < MIN_LENGTH || self.nameTextField.text.length > MAX_LENGTH) {
        alert.title = @"Invalid Username Length";
        alert.message = [NSString stringWithFormat:@"Your Username must be at least %d characters and shorter than %d characters",MIN_LENGTH,MAX_LENGTH];
    }
    else if ([StringUtility checkIfStringContainSpecialCharacter:self.nameTextField.text]) {
        alert.title = @"Invalid username format";
        alert.message = @"Your username cannot contain any special characters";
    }
    else if ([StringUtility checkIfPhoneNumberIsValid:self.emailTextField.text]) {
        alert.title = @"Invalid email format";
        alert.message = @"Your email format is wrong";
    }
    else if ([StringUtility checkIfStringContainSpecialCharacter:self.passwordTextField.text]) {
        alert.title = @"Invalid password format";
        alert.message = @"Your password cannot contain any special characters";
    }
    else if (self.passwordTextField.text.length < MIN_LENGTH || self.passwordTextField.text.length > MAX_LENGTH) {
        alert.title = @"Invalid Password Length";
        alert.message = [NSString stringWithFormat:@"Your Password must be at least %d characters and shorter than %d characters",MIN_LENGTH,MAX_LENGTH];
    }
    else if (![self.confirmPasswordTextField.text isEqualToString:self.passwordTextField.text]) {
        alert.title = @"Your password does not match";
        alert.message = @"Your password does not match";
    }
    else if (![StringUtility checkIfPhoneNumberIsValid:self.phoneNumberTextField.text]) {
        alert.title = @"Invalid Phone Number format";
        alert.message = @"Your Phone Number must be in this format\n1xxxxxxxx";
    }
    else {
        valid = YES;
    }
    
    if (valid) {
        NSLog(@"meep");
    }
    else {
        [alert show];
    }
}

/**
 *  dismiss the keyboard upon tap on self.view
 *  sets the currentTextField to nil
 *  @param touches nil
 *  @param event   nil
 */
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    self.currentTextfield = nil;
}

#pragma mark - UITextField Delegate

/**
 *  sets the next textfield as first responder
 *
 *  @param textField the current selected textfield
 *
 *  @return YES
 */
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

/**
 *  sets the current textfield
 *
 *  @param textField the current textfield;
 */
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.currentTextfield = textField;
    [self keyboardDidShow:nil];
}

@end
