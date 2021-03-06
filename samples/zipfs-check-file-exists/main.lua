----------------------------------------------------------------
-- Copyright (c) 2010-2011 Zipline Games, Inc. 
-- All Rights Reserved. 
-- http://getmoai.com
----------------------------------------------------------------

function printTable ( t, tableName, indentationLevel )
		
	if type ( t ) ~= "table" then
		print ( "WARNING: printTable received \"" .. type ( t ) .. "\" instead of table. Skipping." )
		return
	end
	
	local topLevel = false
	
	if ( not tableName ) and ( not indentationLevel ) then
		
		topLevel = true
		indentationLevel = 1
		
		print ( "\n----------------------------------------------------------------" )
		print ( tostring ( t ) .. "\n" )
	else
		print ( "\n" .. string.rep ( "\t", indentationLevel - 1 ) .. tableName .. " = {" )
	end
	
	if t then
		for k,v in pairs ( t ) do
			
			if ( type ( v ) == "table" ) then 
				
				printTable ( v, tostring ( k ), indentationLevel + 1 )
				
			elseif ( type ( v ) == "string" ) then
				
				print ( string.rep ( "\t", indentationLevel ) .. tostring ( k ) .. " = \"" .. tostring ( v ) .. "\"," )
			else
			
				print ( string.rep ( "\t", indentationLevel ) .. tostring ( k ) .. " = " .. tostring ( v ) .. "," )
			end
		end
	end
	
	if topLevel then
		print ( "\n----------------------------------------------------------------\n" )
	else
		print ( string.rep ( "\t", indentationLevel - 1 ) .. "},\n" )
	end
end

print ( "Mounting test.zip: " .. tostring ( MOAIFileSystem.mountVirtualDirectory ( "testzip", "../resources/test.zip" )))

print ( "Checking if file exists: testzip/assets/levels/main.lua - " .. tostring ( MOAIFileSystem.checkFileExists ( "testzip/assets/levels/main.lua" )))
print ( "Checking if file exists: testzip/assets/main.lua - " .. tostring ( MOAIFileSystem.checkFileExists ( "testzip/assets/main.lua" )))
print ( "Checking if file exists: testzip/assets/bogus.zip - " .. tostring ( MOAIFileSystem.checkFileExists ( "testzip/assets/bogus.zip" )))
print ( "Checking if file exists: testzip/test.zip - " .. tostring ( MOAIFileSystem.checkFileExists ( "testzip/test.zip" )))
print ( "Checking if file exists: testzip/main.lua - " .. tostring ( MOAIFileSystem.checkFileExists ( "testzip/main.lua" )))
