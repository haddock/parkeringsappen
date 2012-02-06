//
//  detailViewController.h
//  iosClient
//
//  Created by Fredrik Bergljung on 2/4/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) id detailItem;

@end
