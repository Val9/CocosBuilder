//
//  NodeExporter.h
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 4/30/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCBXAndEngineXml.h"
#import "XMLWriter.h"

#define CCB_NODEGRAPH @"nodeGraph"
#define CCB_CHILDREN @"children"
#define CCB_PROPERTIES @"properties"
#define CCB_PROPERTIES_PROPERTY_NAME @"name"
#define CCB_PROPERTIES_PROPERTY_VALUE @"value"

#define CCB_POSITION_TYPE_RELATIVE_TOPLEFT 0
#define CCB_POSITION_TYPE_RELATIVE_TOPRIGHT 1
#define CCB_POSITION_TYPE_RELATIVE_BOTTOMLEFT 2
#define CCB_POSITION_TYPE_RELATIVE_BOTTOMRIGHT 3
#define CCB_POSITION_TYPE_PERCENT_PARENT 4

#define CCBAEX_POSITION_TYPE_RELATIVE_TOPLEFT @"relativeTopLeft"
#define CCBAEX_POSITION_TYPE_RELATIVE_TOPRIGHT @"relativeTopRight"
#define CCBAEX_POSITION_TYPE_RELATIVE_BOTTOMLEFT @"relativeBottomLeft"
#define CCBAEX_POSITION_TYPE_RELATIVE_BOTTOMRIGHT @"relativeBottomRight"
#define CCBAEX_POSITION_TYPE_PERCENT_PARENT @"percentParent"

#define CCBAEX_SIZE_TYPE_ABSOLUTE @"absolute"
#define CCBAEX_SIZE_TYPE_RELATIVE_PARENT @"relativeParent"
#define CCBAEX_SIZE_TYPE_PERCENT_PARENT @"percentParent"

@interface NodeExporter : NSObject
{
    NSString* mNodeName;
}

@property (nonatomic,readonly) NSString* nodeName;

- (id) initWithNodeName:(NSString*)pNodeName;

- (void) exportNode:(NSDictionary *)pNode withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (id) findProperty:(NSString *)pProperty withProperties:(NSArray *)pProperties;
- (id) findProperty:(NSString *)pProperty withProperties:(NSArray *)pProperties withIndex:(int)pIndex;

- (NSString *) convertPositionTypeValueToPositionType:(int)pPositionTypeValue;
- (NSString *) convertSizeTypeValueToSizeType:(int)pSizeTypeValue;

@end
