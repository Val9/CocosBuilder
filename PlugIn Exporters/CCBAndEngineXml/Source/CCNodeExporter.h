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
#define CCB_CCNODE_PROPERTY_ANCHORPOINT @"anchorPoint"
#define CCB_CCNODE_PROPERTY_IS_RELATIVE_ANCHORPOINT @"isRelativeAnchorPoint"
#define CCB_CCNODE_PROPERTY_CONTENT_SIZE @"contentSize"
#define CCB_CCNODE_PROPERTY_SCALE @"scale"
#define CCB_CCNODE_PROPERTY_ROTATION @"rotation"
#define CCB_CCNODE_PROPERTY_TAG @"tag"
#define CCB_CCNODE_PROPERTY_VISIBLE @"visible"
#define CCB_CCNODE_PROPERTY_BLENDFUNC @"blendFunc"
#define CCB_CCNODE_PROPERTY_COLOR @"color"
#define CCB_CCNODE_PROPERTY_OPACITY @"opacity"

#define CCBAEX_TAG_CCNODE @"CCNode"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_POSITION_X @"x"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_POSITION_Y @"y"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_POSITION_TYPE @"positionType"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_SIZE_WIDTH @"width"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_SIZE_HEIGHT @"height"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_SIZE_TYPE @"sizeType"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_ANCHORPOINT_X @"anchorPointX"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_ANCHORPOINT_Y @"anchorPointY"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_ANCHORPOINT_IGNORE_FOR_OFFSET @"ignoreAnchorPointForOffset"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_SCALE_X @"scaleX"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_SCALE_Y @"scaleY"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_ROTATION @"rotation"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_TAG @"tag"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_VISIBLE @"visible"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_COLOR_RED @"red"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_COLOR_GREEN @"green"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_COLOR_BLUE @"blue"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_COLOR_ALPHA @"alpha"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_BLENDFUNCTION_SOURCE @"blendFunctionSource"
#define CCBAEX_TAG_CCNODE_ATTRIBUTE_BLENDFUNCTION_DESTINATION @"blendFunctionDestination"

@interface CCNodeExporter : NodeExporter

- (void) exportCCNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

- (void) exportCCNodeContentSize:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCNodePosition:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCNodeAnchorPoint:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCNodeIsRelativeAnchorPoint:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCNodeScale:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCNodeRotation:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCNodeVisible:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCNodeTag:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCNodeColor:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCNodeBlendFunction:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

@end
