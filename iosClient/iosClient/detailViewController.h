//
//  detailViewController.h
//  iosClient
//
//  Created by Fredrik Bergljung on 2/4/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController

/*
@property (weak, nonatomic) IBOutlet UILabel *streetLabel;
@property (weak, nonatomic) IBOutlet UILabel *areacodeLabel;
 */
@property (weak, nonatomic) IBOutlet UILabel *streetLabel;
@property (weak, nonatomic) IBOutlet UILabel *areacodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *startLabel;
@property (weak, nonatomic) IBOutlet UILabel *endLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (strong, nonatomic) id detailItem;

@end
