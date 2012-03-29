//
//  masterTableViewController.m
//  iosClient
//
//  Created by Fredrik Bergljung on 2/4/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import "masterTableViewController.h"
#import "detailViewController.h"
#import "Service.h"

@interface masterTableViewController ()
-(void) loadServices;
@end

@interface masterTableViewController () {
@private
    NSArray* streets;
    CLGeocoder* geocoder;
    CLLocationManager* locationManager;
}
@end


@implementation masterTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    [geocoder reverseGeocodeLocation:locationManager.location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        NSLog(@"Location: %@", [placemark description]);
    }];
    */
    [self loadServices];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)loadServices
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *textFilePath = [bundle pathForResource:@"serviceinfo" ofType:@"csv"];
    NSString *fileData = [NSString stringWithContentsOfFile:textFilePath encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *servicesRaw = [[NSArray alloc] initWithArray:[fileData componentsSeparatedByString:@"\n"]];
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (NSString *service in servicesRaw) {
        NSArray *serviceData = [[NSArray alloc] initWithArray:[service componentsSeparatedByString:@"|"]];
        Service *tmpService = [[Service alloc] init];
        tmpService.street = [serviceData objectAtIndex:0];
        tmpService.serviceDay = [serviceData objectAtIndex:1];
        NSArray *hours = [[NSArray alloc] initWithArray:[[serviceData objectAtIndex:2] componentsSeparatedByString:@"-"]];
        tmpService.starthour = [hours objectAtIndex:0];
        tmpService.endhour = [hours objectAtIndex:1];
        tmpService.areacode = [serviceData objectAtIndex:3];
        if (serviceData.count == 6)
            tmpService.note = [serviceData objectAtIndex:5];
        [result addObject:tmpService];
    }
    
    streets = [NSArray arrayWithArray:result];    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowStreetDetails"]) {
        detailViewController* detail = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [detail setDetailItem:[streets objectAtIndex:indexPath.row]];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [streets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    Service *strt = [streets objectAtIndex:indexPath.row];
    [cell.textLabel setText: [strt street]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


@end
