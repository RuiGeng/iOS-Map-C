//
//  ViewController.h
//  Map-C
//
//  Created by Rui on 2016-11-24.
//  Copyright © 2016 Rui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PinAnnotation.h"

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic,strong)CLLocationManager *locationManager;

@end

