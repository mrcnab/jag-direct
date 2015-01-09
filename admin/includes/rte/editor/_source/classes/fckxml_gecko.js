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
 * File Name: fckxml_gecko.js
 * 	FCKXml Class: class to load and manipulate XML files.
 * 
 * Version:  2.0 FC (Preview)
 * Modified: 2005-03-13 13:10:59
 * 
 * File Authors:
 * 		Frederico Caldeira Knabben (fredck@fckeditor.net)
 */

var FCKXml ;

if ( !( FCKXml = NS.FCKXml ) )
{
	FCKXml = NS.FCKXml = function()
	{}

	FCKXml.prototype.LoadUrl = function( urlToCall )
	{
		var oFCKXml = this ;

		var oXmlHttp = FCKTools.CreateXmlObject( 'XmlHttp' ) ;
		oXmlHttp.open( "GET", urlToCall, false ) ;
		oXmlHttp.send( null ) ;
		
		if ( oXmlHttp.status == 200 )
			this.DOMDocument = oXmlHttp.responseXML ;
		else if ( oXmlHttp.status == 0 && oXmlHttp.readyState == 4 )
			this.DOMDocument = oXmlHttp.responseXML ;
		else
			alert( 'Error loading "' + urlToCall + '"' ) ;
	}

	FCKXml.prototype.SelectNodes = function( xpath, contextNode )
	{
		var aNodeArray = new Array();

		var xPathResult = this.DOMDocument.evaluate( xpath, contextNode ? contextNode : this.DOMDocument, 
				this.DOMDocument.createNSResolver(this.DOMDocument.documentElement), XPathResult.ORDERED_NODE_ITERATOR_TYPE, null) ;
		if ( xPathResult ) 
		{
			var oNode = xPathResult.iterateNext() ;
 			while( oNode )
 			{
 				aNodeArray[aNodeArray.length] = oNode ;
 				oNode = xPathResult.iterateNext();
 			}
		} 
		return aNodeArray ;
	}

	FCKXml.prototype.SelectSingleNode = function( xpath, contextNode ) 
	{
		var xPathResult = this.DOMDocument.evaluate( xpath, contextNode ? contextNode : this.DOMDocument,
				this.DOMDocument.createNSResolver(this.DOMDocument.documentElement), 9, null);

		if ( xPathResult && xPathResult.singleNodeValue )
			return xPathResult.singleNodeValue ;
		else	
			return null ;
	}
}