//
//  CCSpriteExporter.h
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 4/30/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCNodeExporter.h"

#define CCB_CCSPRITE_CLASS_NAME @"CCSprite"

#define CCB_CCSPRITE_PROPERTY_DISPLAYFRAME @"displayFrame"
#define CCB_CCSPRITE_PROPERTY_FLIP @"flip"

#define CCBAEX_TAG_CCSPRITE_ATTRIBUTE_TEXTUREPACK @"texturePack"
#define CCBAEX_TAG_CCSPRITE_ATTRIBUTE_TEXTUREREGION @"textureRegion"
#define CCBAEX_TAG_CCSPRITE_ATTRIBUTE_FLIPPED_HORIZONTAL @"flipX"
#define CCBAEX_TAG_CCSPRITE_ATTRIBUTE_FLIPPED_VERTICAL @"flipY"

@interface CCSpriteExporter : CCNodeExporter

- (void) exportCCSpriteProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

- (void) exportCCSpriteDisplayFrame:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCSpriteFlip:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

@end
