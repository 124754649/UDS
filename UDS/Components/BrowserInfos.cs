﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UDS.Components
{
    public class BrowserInfos
    {
        public static string[,] BrowserAttributes
        {
            get
            {
                string _agent = String.Empty;
                if (HttpContext.Current == null) return null;
                try
                {
                    // detailed string describing some of browser capabilities
                    _agent = HttpContext.Current.Request.UserAgent;
                    // browser capabilities object
                    HttpBrowserCapabilities _browser = HttpContext.Current.Request.Browser;
                    // browser capabilities (properties) 2D array of strings, Name/Value
                    string[,] arrFieldValue = 
                        {
                            {
                                //"Type",
                                "Name",
                                "Version",
                                //"Major Version",
                                //"Minor Version",
                                "Platform",
                                "ECMA Script Version",
                                "Is Mobile Device",
                                "Is Beta",
                                //"Is Crawler",
                                //"Is AOL",
                                "Is Win16",
                                "Is Win32",
                                "Supports Frames",
                                "Supports Tables",
                                "Supports Cookies",
                                "Supports CSS",
                                "Supports VB Script",
                                "Supports JavaScript",
                                "Supports Java Applets",
                                "Supports ActiveX Controls",
                                "Supports CallBack",
                                "Supports XMLHttp",
                                String.Empty,
                                "User Agent Details"
                            }, 
                            {
                                //_browser.Type,
                                (_agent.ToLower().Contains("chrome"))? "Chrome" :_browser.Browser,
                                (_agent.ToLower().Contains("chrome"))? "See User Agent Details below" :_browser.Version,
                                //_browser.MajorVersion.ToString(),
                                //_browser.MinorVersion.ToString(),
                                _browser.Platform,
                                _browser.EcmaScriptVersion.ToString(),
                                (_browser.IsMobileDevice)? "YES": "NO",
                                (_browser.Beta)? "YES": "NO",
                                //_browser.Crawler.ToString(),
                                //_browser.AOL.ToString(),
                                (_browser.Win16)? "YES": "NO",
                                (_browser.Win32)? "YES": "NO",
                    
                                (_browser.Frames)? "YES": "NO",
                                (_browser.Tables)? "YES": "NO",
                                (_browser.Cookies)? "YES": "NO",
                                (_browser.SupportsCss)? "YES": "NO",
                                (_browser.VBScript)? "YES": "NO",
                                (_browser.EcmaScriptVersion.Major > 1)? "YES": "NO",
                                (_browser.JavaApplets)? "YES": "NO",
                                (_browser.ActiveXControls)? "YES": "NO",
                                (_browser.SupportsCallback)? "YES": "NO",
                                (_browser.SupportsXmlHttp)? "YES": "NO",
                                String.Empty,
                                _agent
                            }
                    };

                    return arrFieldValue;
                }
                catch { return null; }
            }
        }
    }
}