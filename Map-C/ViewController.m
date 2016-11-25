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


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    //Create CLGeocoder Object
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    //reverse user location
    [geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error!=nil || placemarks.count==0) {
            return ;
        }
        //get placemark
        CLPlacemark *placemark=[placemarks firstObject];
        //Set user location titile
        userLocation.title=placemark.locality;
        //Set user location subtitile
        userLocation.subtitle=placemark.name;
    }];
    
    /*
     //geographical coordinate structure
    CLLocationCoordinate2D loc = [userLocation coordinate];
    
    NSString longitude = [NSString stringWithFormat:@"%f",loc.longitude];
    
    NSString latitude = [NSString stringWithFormat:@"%f",loc.latitude];
     */
    
}


//Go back to current location
- (IBAction)backCurrentLocation:(id)sender {
    
    MKCoordinateSpan span=MKCoordinateSpanMake(0.01, 0.02);
    
    [self.mapView setRegion:MKCoordinateRegionMake(self.mapView.userLocation.coordinate, span) animated:YES];
}

//called when region changed
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"latitudeDelta:%f,longitudeDelta:%f",mapView.region.span.latitudeDelta,mapView.region.span.longitudeDelta);
}


- (IBAction)minMapView:(id)sender {
    
    CGFloat latitudeDelta = self.mapView.region.span.latitudeDelta * 2;

    CGFloat longitudeDelta = self.mapView.region.span.longitudeDelta * 2;

    MKCoordinateSpan span = MKCoordinateSpanMake(latitudeDelta, longitudeDelta);

    MKCoordinateRegion region = MKCoordinateRegionMake(self.mapView.centerCoordinate, span);
    
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)maxMapView:(id)sender {
    
    CGFloat latitudeDelta = self.mapView.region.span.latitudeDelta * 0.5;

    CGFloat longitudeDelta = self.mapView.region.span.longitudeDelta * 0.5;

    MKCoordinateSpan span = MKCoordinateSpanMake(latitudeDelta, longitudeDelta);

    MKCoordinateRegion region = MKCoordinateRegionMake(self.mapView.centerCoordinate, span);
    
    [self.mapView setRegion:region animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
