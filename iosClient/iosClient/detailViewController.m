//
//  detailViewController.m
//  iosClient
//
//  Created by Fredrik Bergljung on 2/4/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import "detailViewController.h"
#import "Service.h"
#import "DateCalculator.h"

@interface detailViewController()
-(void) configureView;
@end

@implementation detailViewController

@synthesize streetLabel = _streetLabel;
@synthesize areacodeLabel = _areacodeLabel;
@synthesize dayLabel = _dayLabel;
@synthesize startLabel = _startLabel;
@synthesize endLabel = _endLabel;
@synthesize notesLabel = _notesLabel;
@synthesize detailItem = _detailItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)viewDidUnload
{
    [self setStreetLabel:nil];
    [self setAreacodeLabel:nil];
    [self setDayLabel:nil];
    [self setStartLabel:nil];
    [self setEndLabel:nil];
    [self setNotesLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        [self configureView];
    }
}

- (void)configureView
{
    _streetLabel.text = [_detailItem street];
    _areacodeLabel.text = [_detailItem areacode];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    int serviceDay = [[_detailItem serviceDay] intValue];
    _dayLabel.text = [[formatter weekdaySymbols] objectAtIndex:serviceDay];
    _startLabel.text = [_detailItem starthour];
    _endLabel.text = [_detailItem endhour];
    //_notesLabel.text = [_detailItem note];
    
    NSString* nextService = [[_detailItem nextServiceStart] description];
    nextService = [nextService stringByAppendingString:@" - "];
    nextService = [nextService stringByAppendingString:[[_detailItem nextServiceEnd] description]];
    _notesLabel.text = nextService;
    
    

}

@end
