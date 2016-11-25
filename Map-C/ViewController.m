//
//  ViewController.m
//  Map-C
//
//  Created by Rui on 2016-11-24.
//  Copyright © 2016 Rui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //initialize locationManager
    CLLocationManager *locationManager=[[CLLocationManager alloc]init];
    
    self.locationManager=locationManager;
    
    //location Services Enabled
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"location Services is not enabled");
    }
    
    //Ask permission
    if ([UIDevice currentDevice].systemVersion.floatValue >=8.0) {
        //always Authorization
        [self.locationManager requestAlwaysAuthorization];
        //use Authorization
        //[self.locationManager requestWhenInUseAuthorization];
    }
    
    /*
     MKUserTrackingModeNone  //The map does not follow the user location.
     MKUserTrackingModeFollow  //The map follows the user location
     MKUserTrackingModeFollowWithHeading  //The map follows the user location and rotates when the heading changes.
     */
    
    // set tracking mode
    self.mapView.userTrackingMode=MKUserTrackingModeFollow;
    
    /*
     MKMapTypeStandard
     MKMapTypeSatellite
     MKMapTypeHybrid
     MKMapTypeSatelliteFlyover
     MKMapTypeHybridFlyover
     */
    
    // show traffic
    self.mapView.showsTraffic=NO;
    
    //delegate
    self.mapView.delegate=self;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
