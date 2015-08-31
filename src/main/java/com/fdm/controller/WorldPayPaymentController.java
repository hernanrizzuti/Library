/*package com.fdm.controller;

import java.io.*;
import java.net.*;

import javax.servlet.http.*;

import java.security.Security;

import org.w3c.dom.*;
import org.xml.sax.*;
import org.apache.xerces.parsers.DOMParser;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Scope("session")
public class WorldPayPaymentController {

	private final static String merchantCode = "<MERCHANTCODE>";

	// Enter the username you have retrieved from WorldPay
	// The username will generally be the merchantCode
	private final static String userName = "<USERNAME>";

	// Enter the password you have retrieved from WorldPay
	private final static String passWord = "<PASSWORD>";

	// Enter here the URL
	// for the production environment use: https://secure.WorldPay.com:443/jsp/merchant/xml/paymentService.jsp
	// for the test environment use: https://secure-test.WorldPay.com:443/jsp/merchant/xml/paymentService.jsp
	private final static String location = "https://secure-test.WorldPay.com:443/jsp/merchant/xml/paymentService.jsp";

	//use this flag if you wish to set additional arguments
	private boolean hasRedirectArguments = true;

	private static HttpURLConnection huc;

	@RequestMapping(value="/payment.html", method= RequestMethod.GET)
	public void redirectToPaymentMethod(HttpServletRequest req, HttpServletResponse res) throws IOException{
		// First set your security provider, you can also set this provider by adding it to 
		// your java.security settings
		Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		// set protocol handler, this handler can deal with http and https
		System.setProperty("java.protocol.handler.pkgs", "com.sun.net.ssl.internal.www.protocol");
		// create and send your XML message
		String response = sendXml(createXML());
		System.out.println("XML sent to WorldPay");
		if (response.equals("")){
			System.out.println("Problem reported, check System.out logfile");
		}else{
			// Parse the incoming XML and retrieve the redirectURL
			Document document = parseXML(response);
			String redirectURL = getURLFromDocument(document);
			if (redirectURL.equals("")){
				System.out.println("Problem reported, check System.out logfile");
			}else{
				if (hasRedirectArguments){
					System.out.println("redirecting to : " + setRedirectArguments(redirectURL));
					res.sendRedirect(setRedirectArguments(redirectURL));
				}else{
					System.out.println("redirecting to : " + redirectURL);
					res.sendRedirect(redirectURL);
				}
				// Now, all we can do is wait...
			}	
		}
	}

	
	 * Sends a xml message using a secure connection and username password authentication
	 
	public static String sendXml(String theXMLMessage) {
		StringBuffer response = new StringBuffer();
		try{
			URL url = new URL(location);
			huc = (HttpURLConnection)url.openConnection();
			huc.setRequestMethod("POST");
			huc.setRequestProperty("Authorization", "Basic "+encodeBase64((userName+":"+passWord).getBytes()));
			huc.setRequestProperty("Host", url.getHost());
			huc.setDoOutput(true);
			PrintWriter writer = new PrintWriter(huc.getOutputStream());
			writer.println(theXMLMessage);
			writer.flush();
			writer.close();
			BufferedReader br = new BufferedReader(new InputStreamReader(huc.getInputStream()));
			String line;
			while((line = br.readLine()) != null){
				response.append(line);
				response.append("\n");
			}
		}catch(MalformedURLException mfue){	
			System.out.println("The URL is incorrect : ");
			System.out.println(location);
		}catch(IOException ioe){ 
			System.out.println("A connection problem has occured, this could be caused by:\n");
			System.out.println(" - The userName is not correct : "+ userName+ "; Check with WorldPay support at support@WorldPay.com\n");
			System.out.println(" - The password is not correct ; Check with WorldPay support at support@WorldPay.com\n");
			System.out.println(" - The URL is not correct : "+ location +" ; Review the documentation\n");
			System.out.println(" - You are behind a firewall that does not allow secure connections; Contact your network administrator\n");
		}
		System.out.println("Response received : "+response.toString().trim());
		return response.toString().trim();
	}

	
	 * creates an XML message
	 * In this case an XML message is composed that sends a single order with a paymentmethod mask
	 * The response contains a redirectURL or a detailed error message
	 * This is the part where you have to fill in your own OrderCode, OrderContent etc...
	 
	private static String createXML() {
		StringBuffer xmlMessage = new StringBuffer();
		// order code should be unique, the date is unique..
		String orderCode= ""+System.currentTimeMillis();
		xmlMessage.append("<?xml version=\"1.0\"?>");
		xmlMessage.append("<!DOCTYPE paymentService PUBLIC '-//WorldPay/DTD WorldPay PaymentService v1/EN' 'http://dtd.WorldPay.com/paymentService_v1.dtd'>");
		xmlMessage.append("<paymentService version='1.4' merchantCode=\""+merchantCode+"\">");
		xmlMessage.append("<submit>");
		xmlMessage.append("<order orderCode=\""+orderCode+"\">");
		xmlMessage.append("<description>Your Order</description>");
		xmlMessage.append("<amount currencyCode=\"EUR\" value=\"2500\" exponent=\"2\"/>");
		xmlMessage.append("<orderContent>Uw order</orderContent>");
		xmlMessage.append("<paymentMethodMask>");
		xmlMessage.append("<include code=\"ALL\"/>");
		xmlMessage.append("</paymentMethodMask>");
		xmlMessage.append("</order>");
		xmlMessage.append("</submit>");
		xmlMessage.append("</paymentService>");
		System.out.println("Going to send XML : "+xmlMessage.toString());
		return xmlMessage.toString();
	}	

	
	 * encodes a string to Base 64, is used to encode the password for htaccess
	 * DO NOT CHANGE THIS!! IT WORKS !!
	 * (unless you know what you are doing of course)
	 
	public static String encodeBase64(byte[] d){
		if (d == null) return null;
		byte data[] = new byte[d.length+2];
		System.arraycopy(d, 0, data, 0, d.length);
		byte dest[] = new byte[(data.length/3)*4];
		// 3-byte to 4-byte conversion
		for (int sidx = 0, didx=0; sidx < d.length; sidx += 3, didx += 4){
			dest[didx]   = (byte) ((data[sidx] >>> 2) & 077);
			dest[didx+1] = (byte) ((data[sidx+1] >>> 4) & 017 | (data[sidx] << 4) & 077);
			dest[didx+2] = (byte) ((data[sidx+2] >>> 6) & 003 | (data[sidx+1] << 2) & 077);
			dest[didx+3] = (byte) (data[sidx+2] & 077);
		}
		// 0-63 to ascii printable conversion
		for (int idx = 0; idx <dest.length; idx++) {
			if (dest[idx] < 26)     dest[idx] = (byte)(dest[idx] + 'A');
			else if (dest[idx] < 52)  dest[idx] = (byte)(dest[idx] + 'a' - 26);
			else if (dest[idx] < 62)  dest[idx] = (byte)(dest[idx] + '0' - 52);
			else if (dest[idx] < 63)  dest[idx] = (byte)'+';
			else dest[idx] = (byte)'/';
		}
		// add padding
		for (int idx = dest.length-1; idx > (d.length*4)/3; idx--){
			dest[idx] = (byte)'=';
		}
		return new String(dest);
	}


	
	 * Uses Xerces to parse an XML string to an XML document, you can use any other parser
	 
	private Document parseXML(String xml){
		DOMParser parser = new DOMParser(); 
		try{
			parser.parse(new InputSource(new StringReader(xml))); 
		}catch(Exception e) {
			System.out.println("Could not parse XML : "+e);
		}
		return parser.getDocument();
	}


	
	 * Gets the redirectURL from an XML Document
	 * If you wish to retrieve more information from the XML you can use a similar method
	 
	private String getURLFromDocument(Document document){
		Element paymentService = document.getDocumentElement();
		Node serviceType = paymentService.getFirstChild();
		while(serviceType.getNodeType() != Node.ELEMENT_NODE) {
			serviceType = serviceType.getNextSibling();
		}
		Element serviceTypeElement = (Element)serviceType;
		Element referenceElement = (Element)serviceTypeElement.getElementsByTagName("reference").item(0);
		return ""+((org.w3c.dom.Text)referenceElement.getFirstChild()).getData();
	}	


	
	 * If additional parameters need to be set, they can be specified here
	 
	private String setRedirectArguments(String url){
		// Some optional redirect variables (in many cases, it is wise to 'URL encode' the values):
		String bodyAttr		= URLEncoder.encode("background=\"http://www.myshop.com/logo.gif/\"");
		String fontAttr		= "";
		String successUrl	= URLEncoder.encode("http://www.myshop.com/success.html");
		String failureUrl	= URLEncoder.encode("http://www.myshop.com/failure.html");
		String returnUrl	= "";
		String language		= "";
		String country		= "";
		String redirArgs = "";
		if (!language.trim().equals(""))	{ redirArgs += "&Language=" + language; }
		if (!country.trim().equals(""))		{ redirArgs += "&Country=" + country; }
		if (!bodyAttr.trim().equals(""))	{ redirArgs += "&BodyAttr=" + bodyAttr; }
		if (!fontAttr.trim().equals("")) 	{ redirArgs += "&FontAttr=" + fontAttr; }
		if (!successUrl.trim().equals(""))	{ redirArgs += "&SuccessURL=" + successUrl; }
		if (!failureUrl.trim().equals(""))	{ redirArgs += "&FailureURL=" + failureUrl; }
		if (!returnUrl.trim().equals(""))	{ redirArgs += "&ReturnURL=" + returnUrl; }
		// Send the shopper to the Shopper Server.
		return url+redirArgs;
	}

}
*/