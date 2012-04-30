//
//  CCNodeExporter.h
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 4/30/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NodeExporter.h"

#define CCB_CCNODE_CLASS_NAME @"CCNode"
#define CCB_CCNODE_PROPERTY_POSITION @"position"
#define CCB_CCNODE_PROPERTY_CONTENT_SIZE @"contentSize"

#define CCBAEX_TAG_CCNODE @"CCNode"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_POSITION_X @"x"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_POSITION_Y @"y"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_POSITION_TYPE @"positionType"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_SIZE_WIDTH @"width"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_SIZE_HEIGHT @"height"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_SIZE_TYPE @"sizeType"

@interface CCNodeExporter : NodeExporter

- (id) initWithNodeName:(NSString *)pNodeName;

- (void) exportCCNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

@end
