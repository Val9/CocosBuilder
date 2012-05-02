//
//  CCRotatingSpriteExporter.h
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/01/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCSpriteExporter.h"

#define CCB_CCROTATINGSPRITE_CLASS_NAME @"CCRotatingSprite"

#define CCB_CCROTATINGSPRITE_PROPERTY_SECONDS_PER_ROTATION @"secondsPerRotation"

#define CCBAEX_TAG_CCROTATINGSPRITE_ATTRIBUTE_SECONDS_PER_ROTATION @"secondsPerRotation"

@interface CCRotatingSpriteExporter : CCSpriteExporter

- (void) exportCCRotatingSpriteProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

- (void) exportCCRotatingSpriteSecondsPerRotation:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

@end
