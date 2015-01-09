﻿/*
 * FCKeditor - The text editor for internet
 * Copyright (C) 2003-2004 Frederico Caldeira Knabben
 * 
 * Licensed under the terms of the GNU Lesser General Public License:
 * 		http://www.opensource.org/licenses/lgpl-license.php
 * 
 * For further information visit:
 * 		http://www.fckeditor.net/
 * 
 * File Name: fckxhtml_ie.js
 * 	Defines the FCKXHtml object, responsible for the XHTML operations.
 * 	IE specific.
 * 
 * Version:  2.0 FC (Preview)
 * Modified: 2005-02-24 00:20:19
 * 
 * File Authors:
 * 		Frederico Caldeira Knabben (fredck@fckeditor.net)
 */

FCKXHtml._GetMainXmlString = function()
{
	return this.MainNode.xml ;
}

FCKXHtml._AppendEntity = function( xmlNode, entity )
{
	xmlNode.appendChild( this.XML.createEntityReference( entity ) ) ;
}

FCKXHtml._AppendAttributes = function( xmlNode, htmlNode, node, nodeName )
{
	var aAttributes = htmlNode.attributes ;

	for ( var n = 0 ; n < aAttributes.length ; n++ )
	{
		var oAttribute = aAttributes[n] ;

		if ( oAttribute.specified )
		{
			var sAttName = oAttribute.nodeName.toLowerCase() ;

			// The "_fckxhtmljob" attribute is used to mark the already processed elements.
			if ( sAttName == '_fckxhtmljob' )
				continue ;
			// The following must be done because of a bug on IE regarding the style
			// attribute. It returns "null" for the nodeValue.
			else if ( sAttName == 'style' )
				var sAttValue = htmlNode.style.cssText ;
			// There are two cases when the oAttribute.nodeValue must be used:
			//		- for the "class" attribute
			//		- for events attributes (on IE only).
			else if ( sAttName == 'class' || sAttName.indexOf('on') == 0 )
				var sAttValue = oAttribute.nodeValue ;
			else if ( nodeName == 'body' && sAttName == 'contenteditable' )
				continue ;
			// XHTML doens't support attribute minimization like "CHECKED". It must be trasformed to cheched="checked".
			else if ( oAttribute.nodeValue === true )
				sAttValue = sAttName ;
			// We must use getAttribute to get it exactly as it is defined.
			else
				var sAttValue = htmlNode.getAttribute( sAttName, 2 ) ;	

			if ( FCKConfig.ForceSimpleAmpersand && sAttValue.replace )
				sAttValue = sAttValue.replace( /&/g, '___FCKAmp___' ) ;

			this._AppendAttribute( node, sAttName, sAttValue ) ;
		}
	}
}

FCKXHtml.TagProcessors['meta'] = function( node, htmlNode )
{
	var oHttpEquiv = node.attributes.getNamedItem( 'http-equiv' ) ;

	if ( oHttpEquiv == null || oHttpEquiv.value.length == 0 )
	{
		// Get the http-equiv value from the outerHTML.
		var sHttpEquiv = htmlNode.outerHTML.match( FCKRegexLib.MetaHttpEquiv ) ;

		if ( sHttpEquiv )
		{
			sHttpEquiv = sHttpEquiv[1] ;
			FCKXHtml._AppendAttribute( node, 'http-equiv', sHttpEquiv ) ;
		}
	}

	return node ;
}

// IE automatically changes <FONT> tags to <FONT size=+0>.
FCKXHtml.TagProcessors['font'] = function( node, htmlNode )
{
	if ( node.attributes.length == 0 )
		node = FCKXHtml.XML.createDocumentFragment() ;

	FCKXHtml._AppendChildNodes( node, htmlNode ) ;

	return node ;
}

// IE doens't see the value attribute as an attribute for the <input> tag.
FCKXHtml.TagProcessors['input'] = function( node, htmlNode )
{
	if ( htmlNode.name )
		FCKXHtml._AppendAttribute( node, 'name', htmlNode.name ) ;

	if ( htmlNode.value && !node.attributes.getNamedItem( 'value' ) )
		FCKXHtml._AppendAttribute( node, 'value', htmlNode.value ) ;

	return node ;
}

// IE ignores the "SELECTED" attribute so we must add it manually.
FCKXHtml.TagProcessors['option'] = function( node, htmlNode )
{
	if ( htmlNode.selected && !node.attributes.getNamedItem( 'selected' ) )
		FCKXHtml._AppendAttribute( node, 'selected', 'selected' ) ;

	FCKXHtml._AppendChildNodes( node, htmlNode ) ;

	return node ;
}

// There is a BUG in IE regarding the ABBR tag.
FCKXHtml.TagProcessors['abbr'] = function( node, htmlNode )
{
	var oNextNode = htmlNode.nextSibling ;

	while ( true )
	{
		if ( oNextNode && oNextNode.nodeName != '/ABBR' )
		{
			FCKXHtml._AppendNode( node, oNextNode ) ;
			oNextNode = oNextNode.nextSibling ;
		}
		else
			break ;
	}

	return node ;
}

// IE ignores the "COORDS" and "SHAPE" attribute so we must add it manually.
FCKXHtml.TagProcessors['area'] = function( node, htmlNode )
{
	if ( ! node.attributes.getNamedItem( 'coords' ) )
	{
		var sCoords = htmlNode.getAttribute( 'coords', 2 ) ;
		if ( sCoords && sCoords != '0,0,0' )
			FCKXHtml._AppendAttribute( node, 'coords', sCoords ) ;
	}

	if ( ! node.attributes.getNamedItem( 'shape' ) )
	{
		var sCoords = htmlNode.getAttribute( 'shape', 2 ) ;
		if ( sCoords && sCoords.length > 0 )
			FCKXHtml._AppendAttribute( node, 'shape', sCoords ) ;
	}

	return node ;
}

FCKXHtml.TagProcessors['label'] = function( node, htmlNode )
{
	if ( htmlNode.htmlFor.length > 0 )
		FCKXHtml._AppendAttribute( node, 'for', htmlNode.htmlFor ) ;

	FCKXHtml._AppendChildNodes( node, htmlNode ) ;

	return node ;
}

FCKXHtml.TagProcessors['form'] = function( node, htmlNode )
{
	if ( htmlNode.acceptCharset.length > 0 && htmlNode.acceptCharset != 'UNKNOWN' )
		FCKXHtml._AppendAttribute( node, 'accept-charset', htmlNode.acceptCharset ) ;

	FCKXHtml._AppendChildNodes( node, htmlNode ) ;

	return node ;
}