//
//  ViewController.m
//  ForceTouch
//
//  Created by vee on 2017/1/8.
//  Copyright © 2017年 vee. All rights reserved.
//

#import "ViewController.h"
#import "VForceTouchGestureRecognizer.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *tapStateLabel;
@property (nonatomic, weak) IBOutlet UILabel *longStateLabel;
@property (nonatomic, weak) IBOutlet UILabel *forceStateLabel;

@property (nonatomic, weak) IBOutlet UIView *operationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer* tg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureReconized:)];
    [_operationView addGestureRecognizer:tg];
    
    UILongPressGestureRecognizer* lg = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longGestureReconized:)];
    [_operationView addGestureRecognizer:lg];
    
    VForceTouchGestureRecognizer* fg = [[VForceTouchGestureRecognizer alloc] initWithTarget:self action:@selector(forceGestureReconized:)];
    [_operationView addGestureRecognizer:fg];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapGestureReconized:(UITapGestureRecognizer*)tg
{
    [self showStateForGesture:tg toLabel:_tapStateLabel withGestureDescription:@"Tap GR :"];
}

- (void)longGestureReconized:(UILongPressGestureRecognizer*)lg
{
    [self showStateForGesture:lg toLabel:_longStateLabel withGestureDescription:@"Long GR :"];
}

- (void)forceGestureReconized:(VForceTouchGestureRecognizer*)fg
{
    [self showStateForGesture:fg toLabel:_forceStateLabel withGestureDescription:@"Force GR :"];
}

- (void)showStateForGesture:(UIGestureRecognizer*)gr toLabel:(UILabel*)stateLabel withGestureDescription:(NSString*)description
{
    NSString* stateString = @"Unknow";
    switch (gr.state) {
        case UIGestureRecognizerStatePossible:
            stateString = @"Possible";
            break;
        case UIGestureRecognizerStateBegan:
            stateString = @"Began";
            break;
        case UIGestureRecognizerStateChanged:
            stateString = @"Changed";
            break;
        case UIGestureRecognizerStateEnded:
            stateString = @"Ended";
            break;
        case UIGestureRecognizerStateFailed:
            stateString = @"Failed";
            break;
        case UIGestureRecognizerStateCancelled:
            stateString = @"Cancelled";
            break;
        default:
            break;
    }
    stateLabel.text = [description stringByAppendingString:stateString];
    NSLog(@"%@ is %@",NSStringFromClass(gr.class),stateString);
}


@end
