//
//  PinAnnotation.h
//  Map-C
//
//  Created by Rui on 2016-11-24.
//  Copyright © 2016 Rui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface PinAnnotation : NSObject <MKAnnotation>

//coordinates
@property (nonatomic)CLLocationCoordinate2D coordinate;
//title
@property (nonatomic,copy)NSString *title;
//subtitle
@property (nonatomic,copy)NSString *subtitle;

@end
