# VTGUI

About:

This is a simple Powershell Utility to query hashes and url against the VirusTotal API. This tool helps in Threat Intelligence and Threat Hunting. When searching the internet for something similar, I was not able to find anything, so I decided to build it. 

Install:

As this is a powershell script, there is no real install. Just add your VT API key in "-value" parameter in the first line. This can be a free API key from a non-enterprise account. Then run the powershell script either from command line or right-click and 'Run with Powershell'.

Use: 

1a. Paste a Hash, URL, or new line seperated list of Hash or URLs into the IOCs text box.

OR

1b. Alternatively, you can put a path to a .csv file in the text box and it will use the IOCs from the csv. The csv MUST have a column heading of "ioc" where you want to pull the list of IOCs from.

2. Select whether you want to scan Hashes or URLs.

3. Click the "Execute" button to query VT. 

Indicators that are found in VT will populate the top 'Results' Grid, color coded. Green is for no malicious or suspicious results, orange for suspicious not malicious results. Red for malicious results. Indicators not found in VT will populate the bottom 'No Scan' Grid. 

Other Features:

Copy: Select a radio button in the Copy box and push the Copy button. This will copy the IOCs to your clipboard for pasting. Types of copy:
  1. All: Copies all IOCs in the 'Results' (Top) Grid.
  2. Malicious: Copies IOCs from the 'Results' Grid that have >1 Malicious or Suspicious Score.
  3. Cell: Copies the ioc from the selected Row in the 'Results' Grid.
  4. No Scan: Copies the iocs from the 'No Scan' Grid

Input and Output .CSV Files: The Execute and Export functions will check to see if the "IOCs" and "Output" text box contains a .csv file to import and export to. Depending on the function, a missing .csv list will behave differently.
  Input: If a .csv is entered but cannot be found, the input will be treated as an IOC to scan. Causing a "no scan" result.
  Export: If a .csv is not entered in the output text box, export will place the exported csv in .\output_ioc.csv

API Key: Select the "API Key" checkbox at the bottom and a text box will appear showing the API key currently in use. 

Dark Mode: Select the "Dark Mode" checkbox to change the GUI to a dark mode. 
	
 
Example Use Cases:
1. From Intel or Hunting, gather a list of URLs or Hashes and query them in VT to see maliciousnous or unknown files.
2. Convert MD5 -> SHA256 or SHA256 -> MD5 for files in VT.
3. Find Last Final URL from a list of URLs (like URL Shorteners with redirects!)
4. *With a little modification* Scan hashes against VT to test if your specific AV Engine detects the hash
